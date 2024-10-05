class Patient < ApplicationRecord
  has_many :patient_schedules
  belongs_to :doctor
end
