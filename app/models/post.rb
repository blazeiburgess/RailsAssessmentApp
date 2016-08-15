class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  before_save :default_title_is_anonymous
  validates :body, presence: true
  validates :title, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed" }
  
  def board
    topic.board
  end

  def created
    created_at.strftime("%-d %B, %Y: %l:%M%P")
  end

  def edited
    updated_at.strftime("%-d %B, %Y: %l:%M%P")
  end

  def default_title_is_anonymous
    self.title = "Anonymous"
  end

  def user_topic=(user_topic_parameters)
    # byebug
    if user_topic_parameters.delete("favorite?")
      UserTopic.create(user_topic_parameters)
    end
  end
end
