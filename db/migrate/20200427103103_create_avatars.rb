class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.text :filename,    null: false
      t.text :imgpath,     null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
