class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])

  end

  def create
    @post = Post.create(post_params)
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :topic_id, :title, :body)
    end
end
