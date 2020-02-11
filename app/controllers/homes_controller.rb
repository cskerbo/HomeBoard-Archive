class HomesController < ApplicationController
  def new
    @home = Home.new
  end

  def create
    @user = current_user
    @home = Home.create(home_params)
    @home.user_ids = @user.id
    if @home.save
      redirect_to user_user_home_path(current_user, @home)
    else
      render 'new'
    end
  end

   def show
      @user = current_user
      @home = Home.find(params[:id])
      if !@home.user_ids.include?(current_user.id)
        redirect_to '/403'
      end
  end

  private

  def home_params
    params.require(:home).permit(:name, :zip_code)
  end

end
