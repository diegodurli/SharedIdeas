class GalleriesController < ApplicationController
  before_filter :authenticate_user!, :find_gallery

  def index
    respond_with @galleries
  end

  def show
    respond_with @gallery
  end

  def new
    @gallery = Gallery.new
    respond_with @gallery
  end

  def edit
  end

  def create
    @gallery = Gallery.new(params[:gallery])
    if @gallery.save
      respond_with @gallery, location: galleries_path
    else
      render :index
    end
  end

  def update
    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = 'Gallery was successfully updated.'
      respond_with @gallery, location: galleries_path
    else
      flash[:error] = "Gallery wasn't successfully updated."
      redirect_to galleries_path
    end
  end

  def destroy
    @gallery.destroy
    respond_with @gallery, location: galleries_path
  end
  
  protected

  def find_gallery
    @galleries = Gallery.all           unless params[:id]
    @gallery   = Gallery.find(params[:id]) if params[:id]
  end
end