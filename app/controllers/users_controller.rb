class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin?, only: [:admin_index]

  def show
    @user = User.find(params[:id])
  end
  
  def favorite
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "ユーザ情報を更新できませんでした。"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def unsubscribe
    @user = User.find(params[:id])
  end
  
  def admin_index
    @users = User.all
  end
  
  private
  
  def admin?
	   if current_user.admin == false
	       redirect_to root_path
	   end
	end

  def user_params
    params.require(:user).permit(:email, :name, :image, :profile )
  end
  
end
