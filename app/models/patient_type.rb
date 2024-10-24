class PatientType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', color: '#dddddd' },
    { id: 2, name: '入院', color: '#1abc9c' },  # 緑
    { id: 3, name: '退院', color: '#e74c3c' },  # 赤
    { id: 4, name: '検査', color: '#3498db' },  # 青
    { id: 5, name: '手術', color: '#9b59b6' },  # 紫
    { id: 6, name: '説明', color: '#f39c12' },  # オレンジ
    { id: 7, name: '処置', color: '#2ecc71' },  # 明るい緑
    { id: 8, name: '外来', color: '#e67e22' }   # ダークオレンジ
  ]  
  include ActiveHash::Associations
  has_many :patient_schedules

end


