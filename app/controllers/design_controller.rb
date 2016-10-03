class DesignController < ApplicationController
  
  def new
  	@user_id = params[:id]
  	@design = Design.new
  end

  def create
  	if session["current_user_id"] != nil
	  design = Design.create(name: params[:design][:name], 
	  	description: params[:design][:description], user_id: session["current_user_id"],
	  	image: params[:design][:image], price: params[:design][:price])

  	elsif session["warden.user.user.key"][0][0] != nil
	  design = Design.create(name: params[:design][:name], 
	  	description: params[:design][:description], user_id: session["warden.user.user.key"][0][0],
	  	image: params[:design][:image], price: params[:design][:price]) 

  	end

  	redirect_to user_profile_path
  end

  def delete
  	if session["current_user_id"] != nil
  	  design = Design.where("user_id = ?", session["current_user_id"]).where("id = ?", params[:id]).first
      design.destroy
    elsif session["warden.user.user.key"][0][0] != nil
  	  design = Design.where("user_id = ?", session["warden.user.user.key"][0][0]).where("id = ?", params[:id]).first
      design.destroy
  	end
    redirect_to user_profile_path
  end

end
