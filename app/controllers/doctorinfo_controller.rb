class DoctorinfoController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @treatment_histories = TreatmentHistory.all
    @users = User.all
  end

  def doctorprofile
    flash[:doctorprofile] = "doctorprofile"
    redirect_to doctorinfo_path(current_user)
  end

  def doctorapointments
    flash[:doctorapointments] = "doctorapointments"
    redirect_to doctorinfo_path(current_user)
  end
  
  def updatenamedoctor
    flash[:updatenamedoctor] = "updateenamedoctor"
    redirect_to doctorinfo_path(current_user)
  end
end
