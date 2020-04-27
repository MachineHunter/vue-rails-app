class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :status
  has_one :avatar

  validates :email, email: true

  def avatar=(image)
    return unless image.present?

    prefix = image[%r{(image|application)(/.*)(?=\;)}]
    type = prefix.sub(%r{(image|application)(/)}, '')
    self.avatar.filename = filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
    self.avatar.imgpath  = filepath = "#{Rails.root}/app/assets/images/avatars/#{filename}"
    File.open(filepath, 'wb') do |f|
      f.write(image)
    end
  end
end
