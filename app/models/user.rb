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
end
