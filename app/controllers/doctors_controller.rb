class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end
  
  def show
    @doctor = Doctor.find(params[:id]) # 医者を取得
    @patients = @doctor.patients # この医者に関連する患者を取得
    @doctor_schedules = @doctor.doctor_schedules
    @d_schedules = @doctor_schedules.map do |d_schedule|
      { id: d_schedule.id, title: "#{d_schedule.doctor_type.name}", start: d_schedule.start_at, end: d_schedule.end_at }
    end

  end
end
