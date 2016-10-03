class ChargesController < ApplicationController
  
  def new
  
  end

  def create
    @amount = (params[:id].to_f * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur'
    )
    
    flash[:notice] = charge.status
    shipping_address = shipping_address(charge)
    redirect_to root_path
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  def shipping_address(charge)
    buyer_name = charge.source.name
    buyer_address_1 = charge.source.address_line1
    buyer_address_2 = charge.source.address_line2
    buyer_city = charge.source.address_city
    buyer_state = charge.source.address_state
    buyer_zip = charge.source.address_zip
    buyer_country = charge.source.country
    return address = [buyer_name, buyer_address_1,buyer_address_2, buyer_city, buyer_state, buyer_zip, buyer_country]
  end

end
