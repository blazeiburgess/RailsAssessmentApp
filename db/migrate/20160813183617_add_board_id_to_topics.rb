class AddBoardIdToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :board_id, :integer
  end
end
