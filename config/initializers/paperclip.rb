# paperclip_defaults = Rails.application.config_for :paperclip
# paperclip_defaults.symbolize_keys!

# Paperclip::Attachment.default_options.merge! paperclip_defaults
Paperclip::Attachment.default_options[:s3_host_name] = 'afrikart.s3-eu-west-1.amazonaws.com/'