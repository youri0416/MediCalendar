class Task < ApplicationRecord
  belongs_to :doctor
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :title
  belongs_to :occupation

  validates :title_id, numericality: { other_than: 1 } 
  validates :occupation_id, numericality: { other_than: 1 } 
 
end
