class AddCascadeDeleteToPatientSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :patient_schedules, :patients
    add_foreign_key :patient_schedules, :patients, on_delete: :cascade
  end
end
