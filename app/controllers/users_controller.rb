class UsersController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.valid?
      redirect_to new_user_user_home_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user.id != @user.id
      redirect_to '/403'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin, :password_confirmation)
  end
end
