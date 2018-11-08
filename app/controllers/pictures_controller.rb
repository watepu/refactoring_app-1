class PicturesController < ApplicationController
  before_action :check_user, only: [:index, :new, :show, :edit, :destroy,]
  before_action :set_picture, only: [:show, :edit, :update, :destroy,]

  def index
    @pictures = Picture.all
    @user_id = current_user.id
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id

      if @picture.save
        PictureMailer.picture_mail(@picture).deliver
        redirect_to @picture, notice: 'Picture was successfully created.'
      else
        render :new
      end
  end

  def update

      if @picture.update(picture_params)
        redirect_to @picture, notice: 'Picture was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @picture.destroy
      redirect_to user_path(current_user.id), notice: 'Picture was successfully destroyed.'
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:content, :image)
    end
end
