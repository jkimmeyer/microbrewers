require "factory_bot"
require "faker"
require "webmock/rspec"
require "debug"

WebMock.disable_net_connect!(
  allow_localhost: true,
  net_http_connect_on_start: true,
)

RSpec::Matchers.define_negated_matcher :avoid_changing, :change

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.default_formatter = "doc" if config.files_to_run.one?
  config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.before(:each) do
    Faker::Beer.unique.clear
  end

  # On the CI server, print the rails log of each failed test, since we cannot
  # access them otherwise.
  if ENV["CI"]
    # Truncate log before each test to only get logs for that test.
    config.before(:each) do
      File.truncate("log/test.log", 0)
    end

    config.after(:each) do |example|
      if example.exception
        puts "\e[1m---- Rails log from log/test.log for failed example: \e[22m\e[31m#{example.id}\e[36m # #{example.full_description}\e[0m\n"
        File.open("log/test.log") do |file|
          IO.copy_stream(file, $stdout)
        end
      end
    end
  end
end
