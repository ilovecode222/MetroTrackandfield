class CreateAthletes < ActiveRecord::Migration[7.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.date :grade
      t.string :school

      t.timestamps
    end
  end
end
