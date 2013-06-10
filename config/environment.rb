# Load the rails application
require File.expand_path('../application', __FILE__)

config.load_paths += %W(
  {Rails.root}/app/presenters
)
# Initialize the rails application
TimeTrack::Application.initialize!
