class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :status, dependent: :destroy
  has_one_attached :avatar
  attr_accessor :image

  validates :email, email: true

  def avatar=(image)
    return unless image.present?

    prefix = image[%r{(image|application)(/.*)(?=\;)}]
    type = prefix.sub(%r{(image|application)(/)}, '')
    data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
    filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
    File.open("#{Rails.root}/app/assets/images/avatars/#{filename}", 'wb') do |f|
      f.write(data)
    end
    avatar.detach if avatar.attached?
    avatar.attach(io: File.open("#{Rails.root}/app/assets/images/avatars/#{filename}"), filename: filename)
  end
end
