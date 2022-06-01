class UsersController < ApplicationController
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params())
    if @user.save
      flash[:success] = "登録に成功しました。"
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    user = current_user
    avatar = user.avatar.attach(params[:user][:avatar]) if params[:user][:avatar]
    if user.update(user_params) || avatar
      flash[:success] = "更新に成功しました"
      redirect_to root_url
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :info)
  end
  
  def user_img_params
    params.require(:user).permit(:avatar)
  end
end
