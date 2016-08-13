class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  def board
    topic.board
  end
end
