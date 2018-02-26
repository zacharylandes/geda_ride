class RequestService
  attr_accessor :request

  # def initialize(ride,requester,passenger_count)
  #   @ride = ride
  #   @requester = requester
  #   @passenger_count = passenger_count
  #   @request = []
  # end

  def self.request_approval_message(request, ride)
    ["You requested ride with #{ride.user.name} on #{ride.date} has been approved!", "Your ride has been accepted!" ]
  end


end
