class TasksController < ApplicationController
  before_action :set_doctor
  before_action :set_patient
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to doctor_patient_path(@doctor, @patient)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to doctor_patient_path(@doctor, @patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to doctor_patient_path(@doctor, @patient)
  end


  private
  
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
  
  def set_patient
    @patient = @doctor.patients.find(params[:patient_id])
  end
  
  def task_params
    params.require(:task).permit(:title_id, :occupation_id, :name, :phone_number, :content).merge(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
  end

  def set_task
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.find(params[:patient_id])
    @task = @doctor.tasks.find(params[:id])
  end

end
