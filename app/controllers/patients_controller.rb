class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:patient_id]) # 患者を取得
    @patient_schedules = @patient.patient_schedules # 患者のスケジュールを取得
    @schedules = @patient_schedules.map do |schedule| 
      { title: schedule.title, start: schedule.start_at, end: schedule.end_at } 
    end
  end
end