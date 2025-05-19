class Athlete < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :grade, presence: true
  validates :school, presence: true
end
