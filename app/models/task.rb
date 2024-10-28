class Task < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :title
  belongs_to :occupation
  
  validates :completed, inclusion: { in: [true, false] }

  with_options presence: true do
    validates :title_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :occupation_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :name
    validates :phone_number, format: { with: /\A\d+\z/, message: "は数字のみで入力してください" }
    validates :content
  end
end
