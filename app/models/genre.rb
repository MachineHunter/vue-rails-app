class Genre < ApplicationRecord
  has_many :command, dependent: :destroy
end
