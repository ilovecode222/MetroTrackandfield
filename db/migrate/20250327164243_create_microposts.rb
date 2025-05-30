class CreateMicroposts < ActiveRecord::Migration[7.2]
  def change
    create_table :microposts do |t|
      t.text :content
      t.integer :user_id
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
