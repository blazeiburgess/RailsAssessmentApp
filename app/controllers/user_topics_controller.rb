class UserTopicsController < ApplicationController
  def index
    @user_topics = Topic.where(user_id: current_user.id)
  end

  def create
    if user_topic = UserTopic.create(user_topic_params)
      redirect_to user_topics_path
    else
      redirect_to user_topics_path, alert: "Error saving topic to your account"
    end
  end

  def destroy
    user_topic = UserTopic.find(params[:id])
    user_topic.destroy
  end

  private
    def user_topic_params
      params.require(:user_topic).permit(:topic_id, :user_id)
    end
end
