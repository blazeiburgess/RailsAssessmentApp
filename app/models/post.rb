class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  def board
    topic.board
  end

  def created
    created_at.strftime("%-d %B, %Y: %l:%M%P")
  end

  def edited
    updated_at.strftime("%-d %B, %Y: %l:%M%P")
  end
end
