class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :event

  validates :athlete_id, presence: true, numericality: { only_integer: true }
  validates :event_id, presence: true, numericality: { only_integer: true }
  validates :performance, presence: true
  validates :date, presence: true
end
