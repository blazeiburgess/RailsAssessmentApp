class UserTopicsController < ApplicationController
  def index
    @user_topics = UserTopic.where(user_id: current_user.id)
    @user = current_user
  end

  def create
    if user_topic = UserTopic.create(user_topic_params)
      redirect_to board_topic_path(user_topic.topic.board, user_topic.topic), alert: "Stored under 'My Topics'"
    else
      redirect_to board_topics_path(Topic.find(params[:topic_id])), alert: "Error saving topic to your account"
    end
  end

  def destroy
    user_topic = UserTopic.find(params[:id])
    user_topic.destroy
    redirect_to user_topics_path, alert: "Topic successfully unfavorited"
  end

  private
    def user_topic_params
      params.require(:user_topic).permit(:topic_id, :user_id)
    end
end
