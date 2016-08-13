class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.create(post_params)
    redirect_to board_topic_path(@post.topic.board, @post.topic)
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :topic_id, :title, :body)
    end
end
