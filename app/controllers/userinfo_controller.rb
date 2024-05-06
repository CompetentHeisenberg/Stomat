class UserinfoController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def yourprofile
      flash[:yourprofile] = "yourprofile"
      redirect_to userinfo_path(current_user)
    end
    def history
      flash[:history] = "history"
      redirect_to userinfo_path(current_user)
    end

    def appointment
      flash[:appointment] = "appointment"
      redirect_to userinfo_path(current_user)
    end
  end

