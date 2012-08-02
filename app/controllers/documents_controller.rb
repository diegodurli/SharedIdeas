class DocumentsController < ApplicationController
  before_filter :authenticate_user!, :find_gallery_and_documents

  def index
    respond_with @documents
  end

  def show
    respond_with @document
  end

  def new
    @document = @documents.new
    respond_with @document
  end

  def edit
  end

  def create
    @document = @documents.new(params[:document])
    @document.save
    redirect_to gallery_documents_path(@gallery)
  end

  def update
    @document.update_attributes(params[:document])
    respond_with @document
  end

  def destroy
    @document.destroy
    redirect_to gallery_path(@gallery)
  end

  protected

  def find_gallery_and_documents
    @gallery   = Gallery.find(params[:gallery_id])
    @documents = @gallery.documents
    @document  = @documents.find(params[:id]) if params[:id]
  end
end