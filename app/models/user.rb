class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :status, dependent: :destroy
  has_one :avatar, dependent: :destroy
  has_many :command, dependent: :destroy
  attr_accessor :current_password
  attr_accessor :image

  validates :name, length: { maximum: 20, minimum: 2, too_long: '最大20文字までです', too_short: '2文字以上にしてください' }
  validates :email, email: true
end
