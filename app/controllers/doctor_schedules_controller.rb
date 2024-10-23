class DoctorSchedulesController < ApplicationController
  def new
    @doctor = Doctor.find(params[:doctor_id])
    @doctor_schedule = DoctorSchedule.new(
    start_at: Time.current.beginning_of_day,  # 00:00に設定
    end_at: Time.current.beginning_of_day
  )
    @doctor_types = DoctorType.all

    # 'from'の値を取得
    @from = params[:from] if params[:from]
    # クエリパラメーターからpatient_idを取得
    @patient_id = params[:patient_id] if params[:patient_id]
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @doctor_schedule = @doctor.doctor_schedules.new(doctor_schedule_params)

    # クエリパラメーターから 'from' と 'patient_id' を取得
    @from = params[:from]
    @patient_id = params[:patient_id] if params[:patient_id]

    if @doctor_schedule.save
      # リダイレクトの際にクエリパラメータとして 'from' と 'patient_id' を利用
      redirect_to redirect_path(@from, @doctor.id, @patient_id)
    else
      render :new
    end
  end

  private

  def doctor_schedule_params
    params.require(:doctor_schedule).permit(:start_at, :end_at, :doctor_type_id)
  end

  # リダイレクト先を決めるメソッド
  def redirect_path(from, doctor_id, patient_id)
    if from == 'patient' && patient_id
      doctor_patient_path(doctor_id, patient_id) # 患者のshowページにリダイレクト
    else
      doctor_path(doctor_id) # 医者のshowページにリダイレクト
    end
  end
end
