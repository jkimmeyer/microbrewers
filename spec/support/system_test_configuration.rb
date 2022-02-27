# Configures a driver for system tests (in `spec/systems` folder or via `type: :system` metadata).
# See https://api.rubyonrails.org/classes/ActionDispatch/SystemTestCase.html for more information.
#
# Defaults to
# * rack_test for normal tests
# * a custom chrome_headless configuration for tests with `js: true` metadata
#
# You can use other browsers (e.g. visible non-headless ones) by setting the CAPYBARA_BROWSER environment variable.
# Available drivers provided by Rails:
# * chrome
# * firefox
# * headless_chrome (default)
# * headless_firefox
#
# You can add browser args by providing the CAPYBARA_BROWSER_ARGS environment variable.
#
# Example:
# CAPYBARA_BROWSER=chrome CAPYBARA_BROWSER_ARGS="--no-sandbox" bin/rspec spec

Capybara.configure do |config|
  config.enable_aria_label = true # Fields, links, and buttons will match against aria-label attribute.
  config.enable_aria_role = true # Selectors will check for relevant aria role (currently only button).
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    browser = ENV.fetch("CAPYBARA_BROWSER", "chrome").to_sym
    args = ENV.fetch("CAPYBARA_BROWSER_ARGS", "headless window-size=1440,1000")

    Capybara.register_driver browser do |app|
      options = Selenium::WebDriver::Chrome::Options.new(args: args.split)
      options.add_preference "download.default_directory", "tmp/downloads/"
      Capybara::Selenium::Driver.new(app, browser: browser, capabilities: options)
    end

    driven_by(browser)
  end
end
