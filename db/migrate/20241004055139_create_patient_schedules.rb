class CreatePatientSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_schedules do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :patient_type_id, null: false
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
