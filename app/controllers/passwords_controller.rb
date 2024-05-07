class PasswordsController < ApplicationController
  before_action :find_user

  def edit
  end

  def update
    if @user.authenticate(params[:user][:current_password])
      if params[:user][:password] == params[:user][:password_confirmation]
        if @user.update(password_params)
          flash[:ura] = "Password updated successfully!"
          redirect_to userinfo_path(current_user)
        else
          flash[:error] = @user.errors.full_messages.to_sentence
        end
      else
        flash[:password_confirmation_incorrect] = "Password and confirmation do not match"
        redirect_to userinfo_path(current_user)
      end
    else
      flash[:current_password_incorrect] = "Current password is incorrect"
      redirect_to userinfo_path(current_user)
    end
  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
