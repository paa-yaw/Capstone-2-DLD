# The goal will be to ultimately make a Capistrano deploy script that does
# what meteor.sh is doing, but in parallel.

# This assumes you're using an AMI with Node, NPM, Meteor, Forever and
# optionally Meteorite installed

set :application, "YOUR_APP_NAME"

set :repository,  "git@YOUR_GIT_REPO.git"
set :scm, :git
set :deploy_via, :remote_cache
set :user, "ubuntu"
set :deploy_to, "/home/ubuntu/www/APP_NAME"

set :use_sudo, false

set :default_environment, {
  'ROOT_URL' => "http://APP_URL",
  'MONGO_URL' => "mongodb://MONGO_DB_CONNECTION_STRING",
  'PORT' => 9001
}

# This is a Rails-specific param, just want to disable the functionality
set :normalize_asset_timestamps, false

# This would be set to an array of dirs from your app that you want
# to persist across deploys
set :shared_children, %w(log)

# Set this to 'mrt' if you want to use Meteorite
set :meteor, "meteor"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

run_locally('ec2-describe-instances --filter "group-name=open" | grep amazonaws.com | cut -f 4').each_line do |instance|
  server instance, :app
end

namespace :deploy do
  task :restart, :roles => :app do
    run "forever stop --sourceDir #{current_path} bundle/main.js"
    run "forever start --sourceDir #{current_path} -a -l #{shared_path}/log/production.log -e #{shared_path}/log/error.log bundle/main.js"
  end
end

after "deploy:finalize_update" do
  run "cd #{release_path}; #{meteor} bundle bundle.tgz"
  run "cd #{release_path}; tar xvf #{File.join(release_path, "bundle.tgz")}"
  run "rm -rf #{File.join(release_path, "bundle.tgz")}"
end


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"


# If the environment differs from the stage name
set :rails_env, 'staging'

# Defaults to 'db'
set :migration_role, 'migrator'

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
set :assets_roles, [:web, :app]

# Defaults to 'assets'
# This should match config.assets.prefix in your rails config/application.rb
set :assets_prefix, 'prepackaged-assets'

# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')