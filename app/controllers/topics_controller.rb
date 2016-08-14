class TopicsController < ApplicationController
  def index
    @board = Board.find(params[:board_id])
    @topics = @board.topics.shuffle
    @user = current_user
  end

  def show
    @topic = Topic.find(params[:id])
    @board = Board.find(params[:board_id])
    @user = current_user
    @post = Post.new
  end

  def new
    @board = Board.find(params[:board_id])
    if current_user
      
      @topic = Topic.new

    
      @user = current_user
    else
      redirect_to board_path(@board), alert: "You must log in to make a topic"
    end
  end

  def create
    if topic = Topic.create(topic_params)
      redirect_to board_topic_path(topic)
    else
      redirect_to root_path, alert: "Error making your topic"
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless current_user == @post.user || current_user == @post.board.owner
      return redirect_to board_topic_path(@post.board, @post.topic), alert: "You don't have permission to edit this topic"
    end
  end

  def update
    
    post = Post.find(params[:id])
    unless current_user == post.user || current_user == post.board.owner
      return redirect_to board_topic_path(post.board, post.topic), alert: "You don't have permission to edit this post"
    end
    if post.update(post_params)
      redirect_to board_topic_path(post.board, post.topic)
    else
      render :edit, alert: "Error updating post"
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:user_id, :title, :body, :board_id)
    end
end
