class CreateCommandFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :command_files do |t|
      t.text :filename,  null: false
      t.binary :zipdata, null: false
      t.integer :command_id

      t.timestamps
    end
  end
end
