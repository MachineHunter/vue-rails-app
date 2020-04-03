class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.text :title
      t.text :description
      t.text :contents

      t.timestamps
    end
  end
end
