class PhotosController < ApplicationController
  
  before_action :authenticate_user!, except: :index

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(params[:photo].permit(:title, :image, :tag_names))

    if @photo.save
      flash[:notice] = 'Photo added'
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def edit
    @photo = current_user.photos.find params[:id]
  end

  def update
    @photo = Photo.find params[:id]
    @photo.update(params[:photo].permit(:title))

    flash[:notice] = 'Photo updated'
    redirect_to photos_path
  end
end
