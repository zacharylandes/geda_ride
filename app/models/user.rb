class User < ApplicationRecord
  has_many :rides
  mount_uploader :image, ImageUploader

  acts_as_messageable

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end


    def notification_email(object)
    #Check if an email should be sent for that object
    #if true
      return email
    #if false
    #return nil
    end
end
