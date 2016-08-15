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
    if session[:failed_post]
      @post = Post.create(session.delete(:failed_post))
    else
      @post = Post.new
    end
    
    @user_topic = UserTopic.new
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
    topic = Topic.create(topic_params)
    if topic.valid?
      redirect_to board_topic_path(topic.board, topic)
    else
      @board = Board.find(params[:board_id])
      @user = current_user
      @topic = topic      
      render :new

    end
  end

  def edit
    @user = current_user
    @topic = Topic.find(params[:id])
    @board = @topic.board
    unless current_user == @topic.user || current_user == @board.owner
      return redirect_to board_topic_path(@board, @topic), alert: "You don't have permission to edit this topic"
    end
  end

  def update
    
    topic = Topic.find(params[:id])
    unless current_user == topic.user || current_user == topic.board.owner
      return redirect_to board_topic_path(topic.board, topic), alert: "You don't have permission to edit this topic"
    end
    if topic.update(topic_params)
      redirect_to board_topic_path(topic.board, topic)
    else
      render :edit, alert: "Error updating topic"
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:user_id, :title, :body, :board_id)
    end
end
