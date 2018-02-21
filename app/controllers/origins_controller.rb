class OriginsController < ApplicationController
  def index
    origin = Origin.find(params['format'])
    @origins = Origin.where(full_street_address: origin.full_street_address)
  end
end
