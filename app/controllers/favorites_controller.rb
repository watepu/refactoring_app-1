class FavoritesController < ApplicationController
  before_action :check_user, only: [:index]

  def index
    @favorites = current_user.favorites_pictures
  end

  def create
    set_picture
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
      redirect_to pictures_path
    # redirect_to picture_path(params[:picture_id]), notice: "#{favorite.picture.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    # set_picture
    favorite = current_user.favorites.find_by(picture_id: params[:id]).destroy
    if params[:content]
      redirect_to favorites_path
    else
      redirect_to pictures_path
    end
    # redirect_to picture_path(params[:picture_id]), notice: "#{favorite.picture.user.name}さんのブログをお気に入り解除しました"
  end

  private
    def set_picture
      @picture = Picture.find(params[:picture_id])
    end
end
