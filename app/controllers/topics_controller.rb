class TopicsController < ApplicationController
  before_filter :authenticate_user!, :find_topic

  def index
    respond_with @topics
  end

  def show
    @topic = Topic.find(params[:id])
    respond_with @topic
  end

  def new
    @topic = Topic.new
    respond_with @topic
  end

  def edit
  end

  def create
    @topic = Topic.new(params[:topic])

    if @topic.save
      respond_with @topic, location: topics_path
    else
      render :index
    end
  end

  def update
    flash[:error] = "Topic wasn't successfully updated." unless @topic.update_attributes(params[:topic])
    redirect_to topics_path
  end

  def destroy
    @topic.destroy
    respond_with @topic, location: topics_path
  end

  protected

  def find_topic
    @topics = Topic.all           unless params[:id]
    @topic  = Topic.find(params[:id]) if params[:id]
  end
end