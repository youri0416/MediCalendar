class RemoveDoctorForeignKeyFromDoctorSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :doctor_schedules, :doctors
    add_foreign_key :doctor_schedules, :doctors, on_delete: :cascade
  end
end
