class CreateCommandTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :command_types do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
