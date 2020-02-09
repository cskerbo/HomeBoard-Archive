class UserHomesController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @home = Home.find(params[:id])
    if !@home.user_ids.include?(current_user.id)
      redirect_to '/403'
    end
  end

  def new
    @user = User.find(session[:user_id])
    @home = Home.new
  end

end
