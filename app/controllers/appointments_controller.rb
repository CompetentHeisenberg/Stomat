class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_path, notice: 'Запис успішно збережено!'
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :procedure_id, :date, :time)
  end
end
