class CommandType < ApplicationRecord
  has_many :command, dependent: :destroy
end
