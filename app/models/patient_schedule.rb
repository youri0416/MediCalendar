class PatientSchedule < ApplicationRecord
  belongs_to :patient
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :patient_type

  with_options presence: true do 
    validates :start_at
    validates :end_at
    validates :patient_type_id, numericality: { other_than: 1, message: "を選択してください" }
  end

end
