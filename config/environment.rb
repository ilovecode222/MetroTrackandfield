# Load the Rails application.
require_relative "application"

# Debug RAILS_MASTER_KEY presence before Rails initializes
puts "RAILS_MASTER_KEY: #{ENV['RAILS_MASTER_KEY'].present? ? 'Present' : 'Missing'}"
puts "PORT: #{ENV['PORT'] || 'not set'}"

# Initialize the Rails application.
Rails.application.initialize!
