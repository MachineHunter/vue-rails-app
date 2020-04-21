class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :automation,  null: false, default: 0
      t.integer :imagination, null: false, default: 0
      t.integer :humor,       null: false, default: 0
      t.integer :enhancement, null: false, default: 0
      t.integer :user_id,     null: false

      t.timestamps
    end
  end
end
