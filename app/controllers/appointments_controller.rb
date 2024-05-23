class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      current_user.treatment_histories.create(appointment: @appointment)
      redirect_to userinfo_path(current_user)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :procedure_id, :date, :time)
  end
end
