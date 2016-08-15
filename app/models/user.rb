class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :topics
  
  has_many :boards, foreign_key: "owner_id"

  has_many :user_boards
  has_many :user_topics

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["name"]
    end
  end

  def posted_topics
    posts.map(&:topic).uniq
  end

  def saved_topics
    user_topics.map(&:topic)
  end
end
