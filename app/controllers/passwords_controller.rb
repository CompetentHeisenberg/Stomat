class PasswordsController < ApplicationController
  before_action :find_user

  def update
    if @user.authenticate(params[:user][:current_password])
      if params[:user][:password] == params[:user][:password_confirmation]
        if @user.update(password_params)
          flash[:ura] = "Password updated successfully!"
          if @user.role == 'admin'
            redirect_to admininfo_path(current_user)
          elsif @user.role == 'doctor'
            redirect_to doctorinfo_path(current_user)
          else
            redirect_to userinfo_path(current_user)
          end
        else
          flash[:error] = @user.errors.full_messages.to_sentence
        end
      else
        flash[:password_confirmation_incorrect] = "Password and confirmation do not match"
        if @user.role == 'admin'
          redirect_to admininfo_path(current_user)
        elsif @user.role == 'doctor'
          redirect_to doctorinfo_path(current_user)
        else
          redirect_to userinfo_path(current_user)
        end
      end
    else
      flash[:current_password_incorrect] = "Current password is incorrect"
      if @user.role == 'admin'
        redirect_to admininfo_path(current_user)
      elsif @user.role == 'doctor'
        redirect_to doctorinfo_path(current_user)
      else
        redirect_to userinfo_path(current_user)
      end
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
