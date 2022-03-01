Sentry.init do |config|
  config.dsn = "https://78522b5f5c954b108dda18eda4e39bb9@o1155865.ingest.sentry.io/6236652"
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = ->(_context) do
    true
  end
end
