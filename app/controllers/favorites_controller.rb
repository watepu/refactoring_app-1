class FavoritesController < ApplicationController
  before_action :check_user, only: [:index]

  def index
    @favorites = current_user.favorites_pictures
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_path(params[:picture_id]), notice: "#{favorite.picture.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:picture_id]).destroy
    redirect_to picture_path(params[:picture_id]), notice: "#{favorite.picture.user.name}さんのブログをお気に入り解除しました"
  end
end
