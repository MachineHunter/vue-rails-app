class Status < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :automation,  numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :imagination, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :humor,       numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :enhancement, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
end
