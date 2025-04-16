class RemoveDoctorForeignKeyFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :tasks, :doctors
    add_foreign_key :tasks, :doctors, on_delete: :cascade
  end
end
