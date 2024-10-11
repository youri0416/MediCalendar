class Title < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '依頼' },
    { id: 3, name: '相談' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks

 end