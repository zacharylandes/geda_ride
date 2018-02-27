require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJQSCFS5HS2WWHZ4A',
    :aws_secret_access_key  => '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',
    :region                 => 'us-west-2'
  }
  config.fog_directory  = ENV['S3_BUCKET']

end
