class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(params[:photo].permit(:title, :image))

    flash[:notice] = 'Photo added'
    redirect_to photos_path
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
    @photo = Photo.find params[:id]
    @photo.update(params[:photo].permit(:title))

    flash[:notice] = 'Photo updated'
    redirect_to photos_path
  end
end
