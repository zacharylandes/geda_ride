require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['aws_access_key_id'],
    :aws_secret_access_key  => ENV['aws_secret_access_key'],
    :region                 => 'us-west-2'
  }
  config.fog_directory  = ENV['S3_BUCKET']
end
