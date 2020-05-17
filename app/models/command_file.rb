class CommandFile < ApplicationRecord
  belongs_to :command

  validates :filesize, file_size: { max_megabytes: 50 }
end
