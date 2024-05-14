class ProfilesController < ApplicationController

  before_action :find_user
  def edit
  end

  def update
      if @user.update(user_params)
          flash[:nameura] = "Password updated successfully!"
          if @user.role == 'admin'
            redirect_to admininfo_path(current_user)
          else
            redirect_to userinfo_path(current_user)
          end
      end
  end

  def find_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:firstname, :surname)
  end
end
