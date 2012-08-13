class CommentsController < ApplicationController
  before_filter :authenticate_user!, :find_topic_and_comments

  def index
    respond_with @comments
  end
  
  def new
    @comment = @topic.comments.new
    respond_with @comment
  end

  def edit
  end

  def create
    @comment = @comments.new(params[:comment])
    flash[:alert] = 'Fail to receive the comment. Double check the fields' unless @comment.save
    redirect_to topic_path(@topic)
  end

  def update
    flash[:alert] = 'Fail to update the comment. Double check the fields' unless @comment.update_attributes(params[:comment])
    redirect_to topic_path(@topic)
  end

  def destroy
    @comment.destroy
    respond_with @comment, location: topic_path(@topic)
  end

  protected

  def find_topic_and_comments
    @topic    = Topic.find(params[:topic_id])
    @comments = @topic.comments
    @comment  = @comments.find(params[:id]) if params[:id]
  end
end