#paperclip.rb
# config/initializers/paperclip.rb

Paperclip::Attachment.default_options[:s3_host_name] = 'lachbucket.s3.amazonaws.com'