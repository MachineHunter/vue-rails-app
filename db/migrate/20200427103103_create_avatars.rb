class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.text :filename,    null: false
      t.binary :image,     null: false, limit: 2.megabyte
      t.integer :user_id

      t.timestamps
    end
  end
end
