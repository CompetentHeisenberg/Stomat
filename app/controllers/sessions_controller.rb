class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "You successfully signed in!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Incorrect Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "exit"
  end
end
