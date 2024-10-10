class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id]) # 患者を取得
    @patient_schedules = @patient.patient_schedules # 患者のスケジュールを取得
    @schedules = @patient_schedules.map do |schedule| 
      { title: "#{schedule.patient_type_id}", start: schedule.start_at, end: schedule.end_at } 
    end
    @doctor = @patient.doctor.id
  end

  
end