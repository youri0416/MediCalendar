class DoctorType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---', color: '#bdc3c7' }, # デフォルトの色
    { id: 2, name: '外来', color: '#3498db' }, # 青系
    { id: 3, name: '手術', color: '#9b59b6' }, # 紫系
    { id: 4, name: '検査', color: '#f1c40f' }, # 黄色系
    { id: 5, name: '処置', color: '#e67e22' }, # オレンジ系
    { id: 6, name: '説明', color: '#2ecc71' }, # 緑系
    { id: 7, name: '会議', color: '#e74c3c' }, # 赤系
    { id: 8, name: '外勤', color: '#34495e' }, # グレー系
    { id: 9, name: '休み', color: '#95a5a6' }, # 薄いグレー
    { id: 10, name: '連絡OK', color: '#16a085' } # エメラルドグリーン
  ]
  include ActiveHash::Associations
  has_many :doctor_schedules
end

