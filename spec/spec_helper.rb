# frozen_string_literal: true

require "appydays/dotenviable"
Appydays::Dotenviable.load(default_rack_env: "test")

require "webhookdb"
require "webhookdb/fixtures"

Webhookdb.load_app
Webhookdb::Fixtures.load_all

RSpec.configure do |config|
  if Webhookdb::INTEGRATION_TESTS_ENABLED
    # Run the integratoin tests defined in the main WebhookDB gem.
    config.full_backtrace = false
    require "webhookdb/spec_helpers/integration"
    config.include(Webhookdb::IntegrationSpecHelpers)
  end
end
