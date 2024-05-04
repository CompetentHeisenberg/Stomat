class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      flash[:success] = "Ви успішно увійшли в систему!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Неправильна електронна адреса або пароль"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Ви вийшли з облікового запису"
  end
end
