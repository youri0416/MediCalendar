class Patient < ApplicationRecord
  has_many :patient_schedules
  has_many :tasks
  belongs_to :doctor
  has_one_attached :icon


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :department
  belongs_to :ward

  validates :gender_id, numericality: { other_than: 1 } 
  validates :department_id, numericality: { other_than: 1 } 
  validates :ward_id, numericality: { other_than: 1 } 

end

