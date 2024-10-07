class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '循環器' },
    { id: 3, name: '外科' },
    { id: 4, name: '小児科' },
    { id: 5, name: '産婦人科' },
    { id: 6, name: '精神科' },
    { id: 7, name: '呼吸器内科' },
    { id: 8, name: '呼吸器外科' },
    { id: 9, name: '泌尿器科' },
    { id: 10, name: '脳神経内科' },
    { id: 11, name: '脳神経外科' }

  ]
  include ActiveHash::Associations
  has_many :patients

end