class ChargesController < ApplicationController


  def create
    ride = Ride.find(params['ride'])
    amount = ride.cost
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    flash[:notice] = "Ride Succesfully Purchased"
    redirect_to user_path(current_user)

    ride.update(pay_status:true)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
