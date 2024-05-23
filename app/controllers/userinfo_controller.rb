class UserinfoController < ApplicationController
  def show
    @appointment = Appointment
    @user = User.find_by(id: params[:id])
    @treatment_histories = @user.treatment_histories
    if @user
      flash[:success] = "User found"
    else
      flash[:error] = "User not found"
      redirect_to root_path
    end
  end
  def yourprofile
    flash[:yourprofile] = "yourprofile"
    redirect_to userinfo_path(current_user)
  end

  def updatename
    flash[:updatename] = "updateename"
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