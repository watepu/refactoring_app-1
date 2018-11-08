class User < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture

  validates :name, presence: true, length: { maximum: 30}
  validates :email, presence: true, length: { maximum: 255},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  before_save { email.downcase! }

end
