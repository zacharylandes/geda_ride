class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :not_found,
                :approval_message,
                :auth_sender,
                :cost,
                :message_tamplate,
                :events,
                :error_event_message

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def auto_sender
    User.create(name:"GedaRide")
  end

  def approval_message(request, ride)
    message = RequestService.request_approval_message(request, ride)
    auto_sender.send_message(User.find(request.user_id), message[0],message[1])
  end

  def events
      events = [ 'https://s3-us-west-1.amazonaws.com/gedaride/spider.jpeg',
                  "https://s3-us-west-1.amazonaws.com/gedaride/guitargrey.jpeg",
                  'https://s3-us-west-1.amazonaws.com/gedaride/hotair.jpeg',
                  'https://s3-us-west-1.amazonaws.com/gedaride/bass.jpeg']
      events.sample
  end

  def cost(distance)
    (distance/24) * 2.50
  end

end
