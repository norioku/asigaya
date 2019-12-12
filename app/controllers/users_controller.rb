class UsersController < ApplicationController

  def show
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
    params.require(:user).permit(:email, :name, :image, :profire )
  end
  
end
