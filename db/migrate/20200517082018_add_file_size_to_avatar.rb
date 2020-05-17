class AddFileSizeToAvatar < ActiveRecord::Migration[5.2]
  def change
    add_column :avatars, :filesize, :integer
  end
end
