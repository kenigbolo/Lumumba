class DesignController < ApplicationController
  
  def new
  	@user_id = params[:id]
  	@design = Design.new
  end

  def create
  	design = Design.create(name: params[:design][:name], description: params[:design][:description], user_id: session["current_user_id"])
  end

end
