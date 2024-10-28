class Patient < ApplicationRecord
  has_many :patient_schedules
  has_many :tasks
  belongs_to :doctor
  has_one_attached :icon


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :department
  belongs_to :ward

  with_options presence: true do
    validates :number, numericality: { only_integer: true }
    validates :name
    validates :name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力してください" }
    validates :gender_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :birthday
    validates :department_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :ward_id, numericality: { other_than: 1, message: "を選択してください" }
  end
end

