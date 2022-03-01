ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

# Load schema.rb if migrations are pending
ActiveRecord::Migration.maintain_test_schema!

require "spec_helper"
require "rspec/rails"
require "capybara/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/shared/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = true

  config.include SystemSpecHelpers, type: :system

  config.with_options type: :feature do |co|
    co.include Rails.application.routes.url_helpers
  end
end
