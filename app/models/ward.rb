class Ward < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'A棟1階' },
    { id: 3, name: 'A棟2階' },
    { id: 4, name: 'A棟3階' },
    { id: 5, name: 'A棟4階' },
    { id: 6, name: 'A棟5階' },
    { id: 7, name: 'B棟1階' },
    { id: 8, name: 'B棟2階' },
    { id: 9, name: 'B棟3階' },
    { id: 10, name: 'B棟4階' },
    { id: 11, name: 'B棟5階' }

  ]

  include ActiveHash::Associations
  has_many :patients
end