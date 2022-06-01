class ResetEmailPasswordController < ApplicationController

  def edit
  end

  def update
    @user = current_user
    if @user && @user.authenticate(params[:user][:current_password])
      user_new_pass_update()
      user_new_email_update()
      if @user.errors.any?
        render :edit, status: :unprocessable_entity
      else
        flash[:success] = "更新に成功しました"
        redirect_to root_url
      end
    else
      @user.errors.add(:base, '現在のパスワードが異なります')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_new_email_update
    user_new_email = params.require(:user).permit(:email)
    @user.update(user_new_email) unless user_new_email == current_user.email    
  end

  def user_new_pass
    params[:user][:password] = params[:user][:new_password]
    params[:user][:password_confirmation] = params[:user][:new_password_confirmation]
    params.require(:user).permit(:password,:password_confirmation)
  end

  def user_new_pass_update
    @user.update(user_new_pass()) unless user_new_pass.blank?
  end

end
