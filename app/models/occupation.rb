class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '看護師' },
    { id: 3, name: '薬剤師' },
    { id: 4, name: 'MSW' },
    { id: 5, name: 'PT' },
    { id: 6, name: 'ST' },
    { id: 7, name: 'OT' },
    { id: 8, name: '栄養士' },
    { id: 9, name: '検査科' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks
 end