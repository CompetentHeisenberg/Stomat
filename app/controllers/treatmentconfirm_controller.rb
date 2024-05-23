class TreatmentconfirmController < ApplicationController
  def confirm
    @treatment = TreatmentHistory.find(params[:id])
    @treatment.update(confirmed: true)
    redirect_to doctorinfo_path
  end

  def reject
    @treatment = TreatmentHistory.find(params[:id])
    @treatment.update(confirmed: false)
    redirect_to doctorinfo_path
  end
end
