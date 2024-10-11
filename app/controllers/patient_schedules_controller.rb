class PatientSchedulesController < ApplicationController
  before_action :set_patient_schedule, only: [:edit, :update, :destroy]
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
  def edit
  end

  def update
    if @patient_schedule.update(patient_schedule_params)
      redirect_to doctor_patient_path(@doctor, @patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient_schedule.destroy
    redirect_to doctor_patient_path(@doctor, @patient)
  end


private

  def patient_schedule_params
    params.require(:patient_schedule).permit(:start_at, :end_at, :patient_type_id).merge(patient_id: params[:patient_id])
  end

  def set_patient_schedule
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.find(params[:patient_id])
    @patient_schedule = @patient.patient_schedules.find(params[:id])
  end

end
