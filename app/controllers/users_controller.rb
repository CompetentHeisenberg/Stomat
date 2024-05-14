# users_controller.rb
class UsersController < ApplicationController

  def index

  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admininfo_path
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'client'
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the app pups, #{@user.name}"
      redirect_to root_path
    else
      render :'users/new'
    end
  end

  def treatment_history
    @treatment_histories = current_user.treatment_histories.includes(:appointment)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
