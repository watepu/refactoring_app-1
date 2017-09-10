class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user
end
