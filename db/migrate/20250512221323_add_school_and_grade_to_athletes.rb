class AddSchoolAndGradeToAthletes < ActiveRecord::Migration[7.2]
  def change
    add_column :athletes, :school, :string
    add_column :athletes, :grade, :date
  end
end
