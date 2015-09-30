paperclip_defaults = Rails.application.config_for :paperclip
paperclip_defaults.symbolize_keys!

Paperclip::Attachment.default_options.merge! paperclip_defaults

production: &production
    storage: :s3
    bucket:  <%= ENV["S3_BUCKET_NAME"] %>
    url:     ":afrikart.s3-eu-west-1.amazonaws.com"
    path:    ":class/:attachment/:id_partition/:style/:filename.:extension"

staging: *production