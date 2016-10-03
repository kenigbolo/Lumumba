class DesignController < ApplicationController
  
  def new
  	@user_id = params[:id]
  	@design = Design.new
  end

  def create
    facebook_user = session["current_user_id"]
    devise_user = session["warden.user.user.key"][0][0]
    name = params[:design][:name]
    desc = params[:design][:description]
    image = params[:design][:image]
    price = params[:design][:price]

  	if facebook_user != nil
  	  
      design = Design.create(
        name: name, 
  	  	description: desc, 
        user_id: facebook_user,
  	  	image: image, 
        price: price
        )

  	elsif devise_user != nil
	  
      design = Design.create(
        name: name, 
  	  	description: desc, 
        user_id: devise_user,
  	  	image: image, 
        price: price
        ) 

  	end

  	redirect_to user_profile_path
  end

  def delete
    facebook_user = session["current_user_id"]
    devise_user = session["warden.user.user.key"][0][0]
  	
    if facebook_user != nil
  	  design = Design.where("user_id = ?", facebook_user).where("id = ?", params[:id]).first
      design.destroy
    elsif devise_user != nil
  	  design = Design.where("user_id = ?", devise_user).where("id = ?", params[:id]).first
      design.destroy
  	end
    redirect_to user_profile_path
  end

end
