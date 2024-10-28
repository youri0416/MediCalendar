class DoctorSchedule < ApplicationRecord
  belongs_to :doctor

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :doctor_type

  with_options presence: true do
    validates :start_at
    validates :end_at
    validates :doctor_type_id, numericality: { other_than: 1, message: "を選択してください" }
  end
end
