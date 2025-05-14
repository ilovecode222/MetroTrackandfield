# app/models/event.rb
class Event < ApplicationRecord
  has_many :results
end

# app/models/athlete.rb
class Athlete < ApplicationRecord
  has_many :results
end

# app/models/result.rb
class Result < ApplicationRecord
  belongs_to :event
  belongs_to :athlete
end
