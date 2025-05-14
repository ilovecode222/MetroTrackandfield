class CreateResults < ActiveRecord::Migration[7.2]
  def change
    create_table :results do |t|
      t.references :athlete, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :performance
      t.date :date

      t.timestamps
    end
  end
end
