class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end
  
  def show
    @doctor = Doctor.find(params[:id]) # 医者を取得
    @patients = @doctor.patients # この医者に関連する患者を取得
  end
end
