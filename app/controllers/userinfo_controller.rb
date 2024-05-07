class UserinfoController < ApplicationController
  def show
    @appointment = Appointment
    @user = User.find_by(id: params[:id])
    if @user
      flash[:success] = "Пользователь найден!"
    else
      flash[:error] = "Пользователь не найден."
      redirect_to root_path
    end
  end
  def yourprofile
    flash[:yourprofile] = "yourprofile"
    redirect_to userinfo_path(current_user)
  end
  def history
    flash[:history] = "history"
    redirect_to userinfo_path(current_user)
  end
  def appoint
    flash[:appointment] = "appointment"
    redirect_to userinfo_path(current_user)
  end
end