class PatientsController < ApplicationController

  def index
    @patients = Patient.all


    if params[:ward_id].present?
      @patients = @patients.where(ward_id: params[:ward_id])
    end

    if params[:department_id].present?
      @patients = @patients.where(department_id: params[:department_id])
    end
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.new
  end

  def create
    @patient = Patient.new(patient_params)
    @doctor = Doctor.find(params[:doctor_id])
    if @patient.save
      redirect_to doctor_patient_path(@doctor, @patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.find(params[:id]) # 患者を取得
    @patient_schedules = @patient.patient_schedules # 患者のスケジュールを取得
    @p_schedules = @patient_schedules.map do |p_schedule| 
      {id: p_schedule.id, title: "#{p_schedule.patient_type.name}", start: p_schedule.start_at, end: p_schedule.end_at } 
    end
    @doctor_schedules = @doctor.doctor_schedules
    @d_schedules = @doctor_schedules.map do |d_schedule|
      { id: d_schedule.id, title: "#{d_schedule.doctor_type.name}", start: d_schedule.start_at, end: d_schedule.end_at }
    end
  
  end

  private

  def patient_params
  params.require(:patient).permit(:number, :name, :name_kana, :gender_id, :birthday, :department_id, :ward_id, :doctor_id)
  end
end