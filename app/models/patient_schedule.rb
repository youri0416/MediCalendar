class PatientSchedule < ApplicationRecord
  belongs_to :patient
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :patient_type

  validates :patient_type_id, numericality: { other_than: 1 }
end
