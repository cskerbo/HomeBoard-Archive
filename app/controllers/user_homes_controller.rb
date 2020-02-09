class UserHomesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @home = Home.find(params[:id])
    if session[:user_id] != @user.id || !@home.user_ids.include?(@user.id)
      redirect_to '/403'
    end
  end

  def new
    @user = User.find(session[:user_id])
    @home = Home.new
  end

  def index
    @user = User.find(session[:user_id])
  end

end
