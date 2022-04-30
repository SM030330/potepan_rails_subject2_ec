class AuthenticateUserController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, :success => "認証に成功しました"
    else
      flash.now[:danger] = "emailとパスワードを確認してください"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "ログアウトしました"
  end

end
