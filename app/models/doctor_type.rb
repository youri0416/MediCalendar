class DoctorType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '外来' },
    { id: 3, name: '手術' },
    { id: 4, name: '検査' },
    { id: 5, name: '処置' },
    { id: 6, name: '説明' },
    { id: 7, name: '会議' },
    { id: 8, name: '外勤' },
    { id: 9, name: '休み' },
    { id: 10, name: '連絡OK' }

  ]
  include ActiveHash::Associations
  has_many :doctor_schedules

end