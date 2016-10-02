class WelcomeController < ApplicationController
  def index

  end

  def view
  	if session["current_user_id"] != nil
  	  @user = User.where("id = ?", session["current_user_id"])[0]
  	  @designs = Design.where("user_id = ?", session["current_user_id"])

  	else
  	  @user = User.where("id = ?", params[:id])[0]
  	  @designs = Design.where("user_id = ?", params[:id])

  	end
  end
end
