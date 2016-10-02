class WelcomeController < ApplicationController
  def index

  end

  def view
  	if session["current_user_id"] != nil
  	  @user = User.where("id = ?", session["current_user_id"])[0]
  	  @designs = Design.where("user_id = ?", session["current_user_id"])
  	elsif params[:id] != nil
  	  @user = User.where("id = ?", params[:id])[0]
  	  @designs = Design.where("user_id = ?", params[:id])
  	else
  	  render :file => 'public/404.html', :status => :not_found, :layout => false
  	end
  end
end
