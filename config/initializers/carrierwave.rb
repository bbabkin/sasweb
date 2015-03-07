# Configuration for Amazon S3

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'AKIAJJIZNUGTAYROR4PA',
      :aws_secret_access_key => "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",
      :region => "us-west-1"
    }
 
  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}"
  else
    config.storage = :fog
  end
 
  # To let CarrierWave work on heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads" 
  config.fog_directory = "sasgold-production"
end
 