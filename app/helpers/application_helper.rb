module ApplicationHelper
  def good_on_off_button_helper(picture_id, user_id)
    if Favorite.find_by(picture_id: picture_id, user_id: user_id) && controller.controller_name == "favorites"
      link_to 'いいねを取り消す', favorite_path(picture_id, content: 'favo'), method: :delete, class: 'btn btn-danger'
    elsif Favorite.find_by(picture_id: picture_id, user_id: user_id) && controller.controller_name == "pictures"
      link_to 'いいねを取り消す', favorite_path(picture_id), method: :delete, class: 'btn btn-danger'
    else
      link_to 'いいね!', favorites_path(picture_id: picture_id),method: :post, class: 'btn btn-primary'
    end
  end
end
