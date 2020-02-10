class SessionController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
    render template: 'session/new'
  end

  def create
    if @user = User.find_by(username: params[:username])
      unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_user_homes_path(@user)
      else
        flash[:password_error] = "Password is incorrect"
        render 'new'
      end
    else
      redirect_to new_session_path
      flash[:username_error] = "Username does not exist"
    end
  end


  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end