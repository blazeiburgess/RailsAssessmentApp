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
  private
    def post_params
      params.require(:post).permit(:user_id, :topic_id, :title, :body)
    end
end
