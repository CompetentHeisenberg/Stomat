# users_controller.rb
class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admininfo_path
  end
  def new
    @user = User.new
  end

  def create_doctor
    @doctor = User.new(user_params)
    @doctor.role = 'doctor'
    if User.exists?(email: @doctor.email) || User.exists?(name: @doctor.name)
      flash[:error] = "error_1"
      render :new, locals: { object: @doctor }
    else
      if @doctor.save
        flash[:success] = "success"
        redirect_to admininfo_path(current_user)
      else
        render :new, locals: { object: @doctor }
      end
    end
  end


  def create
    @user = User.new(user_params)
    @user.role = 'client'
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = #{@user.name}"
      redirect_to root_path
    else
      render :'users/new'
    end
  end

  def treatment_history
    @treatment_histories = current_user.treatment_histories.includes(:appointment)
  end

  def update_role
    @user = User.find(params[:id])
    @user.role = 'admin'
    @user.update(role: params[:role])
    redirect_to admininfo_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
