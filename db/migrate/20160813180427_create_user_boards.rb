class CreateUserBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_boards do |t|
      t.integer :board_id
      t.integer :user_id

      t.timestamps
    end
  end
end
