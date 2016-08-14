class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @random_topics = Board.random_topics
    @recent_topics = Board.recent_topics
  end
end
