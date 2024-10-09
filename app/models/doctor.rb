class Doctor < ApplicationRecord
  has_many :patients
  has_many :doctor_schedules
  has_many :tasks
end
