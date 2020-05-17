class AddFilesizeToCommandFile < ActiveRecord::Migration[5.2]
  def change
    add_column :command_files, :filesize, :integer
  end
end
