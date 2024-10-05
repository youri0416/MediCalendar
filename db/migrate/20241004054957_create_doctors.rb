class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.integer :department_id, null: false
      t.integer :phone_number, null: false
      t.timestamps
    end
  end
end
