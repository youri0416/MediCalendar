class DoctorSchedule < ApplicationRecord
  belongs_to :doctor

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :doctor_type

  validates :doctor_type_id, numericality: { other_than: 1 } 
end
