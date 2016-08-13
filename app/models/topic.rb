class Topic < ApplicationRecord
  has_many :posts
  belongs_to :user
  belongs_to :board

  def created
    created_at.strftime("%-d %B, %Y: %l:%M%P")
  end

  def edited
    updated_at.strftime("%-d %B, %Y: %l:%M%P")
  end
end
