class PatientSchedulesController < ApplicationController
  def new
    @patient_schedule = PatientSchedule.new
    @selected_date = params[:date] # 選択した日付を渡す
    @patient_types = PatientType.all
  end

  def create
    @patient_schedule = PatientSchedule.new(patient_schedule_params)
    if @patient_schedule.save
      redirect_to doctor_patient_path(@patient_schedule.patient.doctor_id, @patient_schedule.patient_id)
    else
      render :new
    end


  end
private

  def patient_schedule_params
    params.require(:patient_schedule).permit(:start_at, :end_at, :patient_type_id).merge(patient_id: params[:patient_id])
  end
end
