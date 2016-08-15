class Topic < ApplicationRecord
  has_many :posts
  belongs_to :user
  belongs_to :board

  validates :title, presence: true
  validates :body, presence: true

  def created
    created_at.strftime("%-d %B, %Y: %l:%M%P")
  end

  def edited
    updated_at.strftime("%-d %B, %Y: %l:%M%P")
  end

  def num_of_responses
    posts.count
  end
end
