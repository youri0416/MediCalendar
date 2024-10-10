class TasksController < ApplicationController
  # before_action :set_patient
  before_action :set_doctor

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # @task.patient = @patient
    @task.doctor = @doctor
binding.pry
    if @task.save
      redirect_to patient_path(@patient)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title_id, :occupation_id, :name, :phone_number, :content,).merge(doctor_id: @doctor.id, patient_id: @doctor.patients)
  end

  # def set_patient
  #   @patient = Patient.find(params[:patient_id])
  # end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
end
