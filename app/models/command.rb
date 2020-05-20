class Command < ApplicationRecord
  belongs_to :genre
  belongs_to :command_type
  belongs_to :user
  has_one :command_file, dependent: :destroy
  accepts_nested_attributes_for :command_file

  validates :description, length: { maximum: 50_000, too_long: '最大5万文字までです' }
  validates :title, length: { maximum: 50, too_long: '最大50文字までです' }
end
