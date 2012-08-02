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
    alert[:alert] = "Gallery wasn't successfully created." unless @gallery.save
    respond_with @gallery
  end

  def update
    flash[:alert] = "Gallery wasn't successfully updated." unless @gallery.update_attributes(params[:gallery])
    respond_with @gallery
  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path
  end
  
  protected

  def find_gallery
    @galleries = Gallery.all           unless params[:id]
    @gallery   = Gallery.find(params[:id]) if params[:id]
  end
end