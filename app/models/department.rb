class Department < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '循環器' },
    { id: 3, name: '消化器内科' },
    { id: 4, name: '呼吸器内科' },
    { id: 5, name: '脳神経内科' },
    { id: 6, name: '腎臓内科' },
    { id: 7, name: '内分泌糖尿病内科' },
    { id: 8, name: '血液内科' },
    { id: 9, name: '小児科' },
    { id: 10, name: '精神科' },
    { id: 11, name: '外科' },
    { id: 12, name: '脳神経外科' },
    { id: 13, name: '心臓血管外科' },
    { id: 14, name: '呼吸器外科' },
    { id: 15, name: '整形外科' },
    { id: 16, name: '眼科' },
    { id: 17, name: '耳鼻咽喉科' },
    { id: 18, name: '泌尿器科' },
    { id: 19, name: '形成外科' },
    { id: 20, name: '皮膚科' },
    { id: 21, name: '産婦人科' },
    { id: 22, name: '歯科口腔外科' },
    { id: 23, name: '救急科' }
  ]

  include ActiveHash::Associations
  has_many :patients
  has_many :doctors

end