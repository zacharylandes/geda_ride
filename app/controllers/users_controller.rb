class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

    # def create
    #   user = User.new(user_params)
    #   if user.save!
    #     redirect_to user_path(user)
    #   else
    #     render :new
    #   end
    # end

  def show
    @requests = Request.where(ride_id: Ride.where(user_id:current_user))
    @user = User.find(params[:id])
    @accepted = Ride.where(passenger:current_user.id) if current_user
  end

  def edit
    @user  = current_user
  end

  def update
    user  = current_user
    user.update(user_params)
    redirect_to user_path(user)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :image)
  end

end
