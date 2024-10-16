class PatientsController < ApplicationController
  def index
    @patients = Patient.all
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

end