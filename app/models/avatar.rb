class Avatar < ApplicationRecord
  belongs_to :user

  validates :filesize, file_size: { max_megabytes: 5 }
end
