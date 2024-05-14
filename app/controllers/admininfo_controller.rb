class AdmininfoController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def adminprofile
    flash[:adminprofile] = "adminprofile"
    redirect_to admininfo_path(current_user)
  end

  def deleteclient
    flash[:deleteclient] = "deleteclient"
    redirect_to admininfo_path(current_user)
  end

  def createdoctor
    flash[:createdoctor] = "createdoctor"
    redirect_to admininfo_path(current_user)
  end
end
