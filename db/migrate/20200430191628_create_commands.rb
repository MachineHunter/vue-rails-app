class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.text :title
      t.text :description
      t.integer :user_id
      t.integer :genre_id
      t.integer :command_type_id

      t.timestamps
    end
  end
end
