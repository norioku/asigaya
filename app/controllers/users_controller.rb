class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_close_path
  end

  def close
    @user = User.find(params[:id])
  end

  def complete
     @user = current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
  
end
