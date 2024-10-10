class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.boolean :completed, null: false, default: false
      t.integer :title_id, null: false
      t.integer :occupation_id, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.text :content, null: false
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
