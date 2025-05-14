class AddIndexToAthletesNameUnique < ActiveRecord::Migration[6.1]
  def change
    add_index :athletes, :name, unique: true
  end
end
