class CreateDoctorSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_schedules do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :doctor_type_id, null: false
      t.references :doctor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
