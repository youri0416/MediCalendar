class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.string :name_kana, null: false
      t.integer :gender_id, null: false
      t.date :birthday, null: false
      t.integer :department_id, null: false
      t.integer :ward_id, null: false
      t.references :doctor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
