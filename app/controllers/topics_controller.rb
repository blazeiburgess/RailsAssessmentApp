class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
  end

  def create
    if topic = Topic.create(topic_params)
      redirect_to topic_path(topic)
    else
      redirect_to root_path, alert: "Error making your topic"
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:user_id, :title, :body, :board_id)
    end
end
