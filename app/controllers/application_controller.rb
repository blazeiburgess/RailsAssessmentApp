class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def home
    @random_topics = Board.random_topics
    @recent_topics = Board.recent_topics
  end

  def news
    @how_things_are = ['fine', 'great', 'wonderful', 'alright', 'decent'].shuffle[0]
  end

  def about
    @text = vaneigem_text
  end
end
