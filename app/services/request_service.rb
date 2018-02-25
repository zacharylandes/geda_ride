class RequestService
  attr_accessor :request

  def initialize(ride,requester,passenger_count)
    @ride = ride
    @requester = requester
    @passenger_count = passenger_count
    @request = []
  end
  #
  # def self.all
  # end
  #
  # def make_request
  #   parent = {}
  #   ride_store = {}
  #   ride_store['requester'] = @requester
  #   ride_store['passenger'] = @passenger_count
  #   parent["#{@ride}"] = ride_store
  #   @request << parent
  #   @request
  # end
  #
  # def self.lookup(ride)
  #   binding.pry
  # end

  def self.request_approval_message(request, ride)
    ["You requested ride with #{ride.user.name} on #{ride.date} has been approved!", "Your ride has been accepted!" ]
  end


end
