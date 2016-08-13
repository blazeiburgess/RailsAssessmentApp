class Board < ApplicationRecord
  has_many :topics
  has_many :posts, through: :topics
  belongs_to :owner, class_name: "User"
end
