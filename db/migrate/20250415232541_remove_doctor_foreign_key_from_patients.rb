class RemoveDoctorForeignKeyFromPatients < ActiveRecord::Migration[7.0]
  def change
    # まず既存の外部キーを削除
    remove_foreign_key :patients, :doctors

    # 再度外部キーを追加し、ON DELETE CASCADE を指定
    add_foreign_key :patients, :doctors, on_delete: :cascade
  end
end
