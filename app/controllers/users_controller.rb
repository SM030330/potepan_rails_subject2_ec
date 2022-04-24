class UsersController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_new_params())
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
  end
  
  def destroy
  end

  private

  def user_new_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
