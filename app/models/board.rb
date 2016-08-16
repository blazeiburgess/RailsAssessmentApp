class Board < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :posts, through: :topics
  belongs_to :owner, class_name: "User"

  validates :title, presence: true
  validates :description, presence: true

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
