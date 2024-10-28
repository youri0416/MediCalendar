class Doctor < ApplicationRecord
  has_many :patients
  has_many :doctor_schedules
  has_many :tasks
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :department  # アクティブハッシュと関連付け

end
