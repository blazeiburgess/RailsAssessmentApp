class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.create(post_params)
    redirect_to board_topic_path(@post.topic.board, @post.topic)
  end

  def destroy
    post = Post.find(params[:id])
    topic = post.topic
    post.destroy
    redirect_to board_topic_path(topic.board, topic), alert: "Post deleted"
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
    unless @post.user == @user || @post.board.owner == @user
      redirect_to board_topic_path(@post.board, @post.topic), alert: "You don't have permission to edit this post"
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to board_topic_path(post.board, post.topic), notice: "Post successfully updated"
    else
      render :edit, notice: "Error updating post"
    end
  end

  def user
    if current_user
      @user = current_user
    else
      redirect_to root_path, alert: "You must be logged in to see posts you've made (obviously)"
    end
  end
  private
    def post_params
      params.require(:post).permit(:user_id, :topic_id, :title, :body)
    end
end
