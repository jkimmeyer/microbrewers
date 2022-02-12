source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.join(__dir__, ".tool-versions")).match(/(?<=ruby)(.*)/).captures.first.strip

gem "rails", "~> 7.0.2"
gem "pg"
gem "puma"
gem "jbuilder"
gem "tzinfo-data"
gem "bootsnap"


group :development, :test do
  gem "debug"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "vite_rails", "~> 3.0"
