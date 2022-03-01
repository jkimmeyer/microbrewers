source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(__dir__, ".tool-versions")).match(/(?<=ruby)(.*)/).captures.first.strip

gem "aws-sdk-s3"
gem "bootsnap"
gem "jbuilder"
gem "pg"
gem "puma"
gem "rails", "~> 7.0.2"
gem "tzinfo-data"
gem "vite_rails", "~> 3.0"

# Application Monitoring
gem "sentry-ruby"
gem "sentry-rails"

group :development, :test do
  gem "debug"
end

group :development do
  gem "web-console"
end

# Testing
group :development, :test do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "faker"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "webmock"
end

group :development, :linting do
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
end
