class Board < ApplicationRecord
  has_many :topics
  has_many :posts, through: :topics
  belongs_to :owner, class_name: "User"

  def self.random_topics
    all.map(&:topics).flatten.shuffle.first(10)
  end

  def self.recent_topics
    all.map(&:topics).flatten.sort {|a, b| a <=> b}.reverse.first(10)
  end

  def last_10_topics
    posts.order("id DESC").map(&:topic).uniq.first(10)
  end
end
