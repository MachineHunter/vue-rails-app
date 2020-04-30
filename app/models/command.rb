class Command < ApplicationRecord
  belongs_to :genre
  belongs_to :command_type
  belongs_to :user
end
