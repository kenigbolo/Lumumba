class CartController < ApplicationController
  
  def new
  	session[:return_to] ||= request.referer
 	id = params[:id]
 	facebook_user = session["current_user_id"]
 	device_user = session["warden.user.user.key"][0][0]
	
	if facebook_user != nil
	  user_cart = find_cart(facebook_user)
	  add_item_to_cart(user_cart, facebook_user, id)
	  # if user_cart != nil
	  #   design = Design.where("id = ?", id).first
	  #   cart = Cart.create(total_amount: design.price, user_id: session["current_user_id"])
	  #   item = Item.create(name: design.name, price: design.price, cart_id: cart.id)
	  # end
	elsif device_user != nil
	  user_cart = find_cart(device_user)
	  add_item_to_cart(user_cart, device_user, id)
	  # if user_cart != nil
	  # 	design = Design.where("id = ?", id).first
	  # 	cart = Cart.create(total_amount: design.price, user_id: session["warden.user.user.key"][0][0])
	  # 	item = Item.create(name: design.name, price: design.price, cart_id: cart.id)
	  # end
  	end

  	redirect_to session.delete(:return_to)
  end

  def show
  	facebook_user = session["current_user_id"]
 	device_user = session["warden.user.user.key"][0][0]
	if facebook_user != nil
	  # @cart = Cart.where("user_id = ?", facebook_user).first
	  # @items = Item.where("cart_id = ?", @cart.id)
	  show_cart(facebook_user)
	elsif device_user != nil
	  # @cart = Cart.where("user_id = ?", device_user).first
	  # @items = Item.where("cart_id = ?", @cart.id)
	  show_cart(device_user)
	end
  end


# Special methods for CartController Class
  
  # Method to search for existence of cart
  def find_cart (params)
  	Cart.where("user_id = ?", params).first
  end

  # Method to search for cart items and render to the show method
  def show_cart (params)
	@cart = Cart.where("user_id = ?", params).first
	@items = Item.where("cart_id = ?", @cart.id)
  end

  # Method to handle logic of adding items to the cart
  def add_item_to_cart(user_cart, session, params_id)
  	if user_cart == nil
	  design = Design.where("id = ?", params_id).first
	  cart = Cart.create(total_amount: design.price, user_id: session)
	  item = Item.create(name: design.name, price: design.price, cart_id: cart.id)
	else
	  design = Design.where("id = ?", params_id).first
	  item = Item.create(name: design.name, price: design.price, cart_id: user_cart.id)
	  user_cart.total_amount += design.price
	  user_cart.save
	end
  end
	
end
