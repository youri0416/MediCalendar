class Ward < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ECU' },
    { id: 3, name: 'A棟2階' },
    { id: 4, name: 'A棟3階' },
    { id: 5, name: 'A棟4階' },
    { id: 6, name: 'A棟5階' },
    { id: 7, name: 'A棟6階' },
    { id: 8, name: 'A棟7階' },
    { id: 9, name: 'A棟8階' },
    { id: 10, name: 'A棟9階' },
    { id: 11, name: 'B棟1階' },
    { id: 12, name: 'B棟2階' },
    { id: 13, name: 'B棟3階' },
    { id: 14, name: 'ICU' },
    { id: 15, name: 'B棟5階' },
    { id: 16, name: 'B棟6階' },
    { id: 17, name: 'B棟7階' },
    { id: 18, name: 'B棟8階' },
    { id: 19, name: 'B棟9階' }
  ]

  include ActiveHash::Associations
  has_many :patients
end