class PatientType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '入院' },
    { id: 3, name: '退院' },
    { id: 4, name: '検査' },
    { id: 5, name: '手術' },
    { id: 6, name: '説明' },
    { id: 7, name: '処置' },
    { id: 8, name: '外来' }
  ]
  include ActiveHash::Associations
  has_many :patient_schedules

end