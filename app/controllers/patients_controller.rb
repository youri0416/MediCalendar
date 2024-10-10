class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.find(params[:id]) # 患者を取得
    @patient_schedules = @patient.patient_schedules # 患者のスケジュールを取得
    @schedules = @patient_schedules.map do |schedule| 
      { title: "#{schedule.patient_type_id}", start: schedule.start_at, end: schedule.end_at } 
    end
  end

end