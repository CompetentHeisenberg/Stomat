class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Ви успішно увійшли в систему!"
      session[:user_id] = user.id
    else
      flash[:alert] = "Неправильна електронна адреса або пароль"
    end
    redirect_to root_path
  end

  def destroy
    # Удаляем идентификатор пользователя из сеанса при выходе
    session[:user_id] = nil
    redirect_to root_path, notice: "Ви вийшли з облікового запису"
  end
end
