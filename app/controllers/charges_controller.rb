class ChargesController < ApplicationController
  
  def new
  
  end

  def create
    @amount = (params[:id].to_f * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
    
    flash[:notice] = charge.status
    redirect_to root_path
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

end
