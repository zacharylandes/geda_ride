class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :not_found,
                :approval_message,
                :auth_sender,
                :cost,
                :message_tamplate,
                :avatars

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

  def avatars
  avatars = ['https://s3-us-west-1.amazonaws.com/gedaride/team-01.png',
  'https://s3-us-west-1.amazonaws.com/gedaride/team-02.png',
  'https://s3-us-west-1.amazonaws.com/gedaride/team-03.png',
  'https://s3-us-west-1.amazonaws.com/gedaride/donkey-avatar.png',
  "https://s3-us-west-1.amazonaws.com/gedaride/leopard-onesie.png", 'https://s3-us-west-1.amazonaws.com/gedaride/bill.jpg',
  'https://s3-us-west-1.amazonaws.com/gedaride/elaine.jpeg',
  "https://s3-us-west-1.amazonaws.com/gedaride/fat-bunny.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/fat-cat.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/george.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/hamster1.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/hamster4.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/ilana.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/jb.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/jesus.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/koala.jpeg",
  "https://s3-us-west-1.amazonaws.com/gedaride/skully.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/tina.png",
  "https://s3-us-west-1.amazonaws.com/gedaride/woody.jpg",
  "https://s3-us-west-1.amazonaws.com/gedaride/mulder.jpg",
  'https://s3-us-west-1.amazonaws.com/gedaride/screech.jpg',
  'https://s3-us-west-1.amazonaws.com/gedaride/panda-bear-avatar.jpg',
  'https://s3-us-west-1.amazonaws.com/gedaride/alex.jpg']

  avatars.sample

  end

  def cost(distance)
    (distance/24) * 2.50
  end

end
