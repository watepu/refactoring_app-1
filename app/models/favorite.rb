class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :picture

  def self.now?(picture_id, user_id)
    find_by(picture_id: picture_id, user_id: user_id)
  end
end
