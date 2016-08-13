class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :description
      t.integer :owner

      t.timestamps
    end
  end
end
