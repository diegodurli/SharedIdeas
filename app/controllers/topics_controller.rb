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
    @topic.save
    respond_with @topic
  end

  def update
    @topic.update_attributes(params[:topic])
    respond_with @topic
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  protected

  def find_topic
    @topics = Topic.all           unless params[:id]
    @topic  = Topic.find(params[:id]) if params[:id]
  end
end