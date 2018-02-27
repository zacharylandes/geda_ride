CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'gedaride'
  config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_credentials = {
    access_key_id:     'AKIAJQSCFS5HS2WWHZ4A',
    secret_access_key: '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',
    endpoint:'https://s3-us-west-1.amazonaws.com/gedaride/',

    region:            "us-west-2" # Required
  }
end
