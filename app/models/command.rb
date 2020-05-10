class Command < ApplicationRecord
  belongs_to :genre
  belongs_to :command_type
  belongs_to :user
  has_one :command_file, dependent: :destroy
  accepts_nested_attributes_for :command_file
end
