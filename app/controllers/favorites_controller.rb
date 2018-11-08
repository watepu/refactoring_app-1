class FavoritesController < ApplicationController
  before_action :check_user, only: [:index,]

  def index
    @favorites = current_user.favorites_pictures
  end

  def create
    set_picture
    current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path
  end

  def destroy
    current_user.favorites.find_by(picture_id: params[:id]).destroy
    if params[:content]
      redirect_to favorites_path
    else
      redirect_to pictures_path
    end
  end

  private
    def set_picture
      @picture = Picture.find(params[:picture_id])
    end
end
