class Board < ApplicationRecord
  has_many :topics
  has_many :posts, through: :topics
  belongs_to :owner, class_name: "User"

  def last_10_topics
    posts.order("id DESC").map(&:topic).uniq.first(10)
  end
end
