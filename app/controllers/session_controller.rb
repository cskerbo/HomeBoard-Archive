class SessionController < ApplicationController
  def new
    @user = User.new
    render template: 'session/new'
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.nil?
      redirect_to new_session_path
      flash[:email_error] = "User does not exist"
    else
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_user_homes_path(@user)
      else
        redirect_to new_session_path
        flash[:password_error] = "Password is incorrect"
      end
    end
    end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

end