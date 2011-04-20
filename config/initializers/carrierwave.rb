CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["AWS_S3_KEY_ID"],
    :aws_secret_access_key  => ENV["AWS_S3_SECRET_KEY"]
  }
  config.fog_directory  = ENV["AWS_S3_BUCKET"]
end
