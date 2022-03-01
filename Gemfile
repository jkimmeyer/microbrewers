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

# Application Monitoring
gem "sentry-rails"
gem "sentry-ruby"

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
  gem "faker"
  gem "webmock"
end

group :development, :linting do
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
end
