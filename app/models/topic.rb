class Topic < ApplicationRecord
  has_many :posts
  belongs_to :user
  belong_to :board
end
