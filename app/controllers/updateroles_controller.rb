class UpdaterolesController < ApplicationController
  before_action :find_user, only: [:update]

  def update
    if @user.update(role: 'admin')
      redirect_to admininfo_path, notice: 'Upadate role'
    else
      redirect_to admininfo_path, alert: 'Dont update role'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
