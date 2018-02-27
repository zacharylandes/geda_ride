class ImageController < ApplicationController
  def new
    @uploader = User.new.image
    @uploader.success_action_redirect = new_user_url
  end
