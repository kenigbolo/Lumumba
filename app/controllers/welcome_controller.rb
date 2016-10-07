class WelcomeController < ApplicationController
  def index

  end

  def view
  	if session["current_user_id"] != nil
  	  @user = User.where("id = ?", session["current_user_id"]).first
  	  @designs = Design.where("user_id = ?", session["current_user_id"]).page(params[:page]).per(5)
  	elsif params[:id] != nil
  	  @user = User.where("id = ?", params[:id]).first
  	  @designs = Design.where("user_id = ?", params[:id]).page(params[:page]).per(5)
  	elsif session["warden.user.user.key"][0][0] != nil
   	  @user = User.where("id = ?", session["warden.user.user.key"][0][0]).first
  	  @designs = Design.where("user_id = ?", session["warden.user.user.key"][0][0]).page(params[:page]).per(5)
  	else
  	  render :file => 'public/404.html', :status => :not_found, :layout => false
  	end
  end
end