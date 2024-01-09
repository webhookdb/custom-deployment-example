# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.2.1"

gem "webhookdb", "~> 1.0"
# See README for how to access private repos.
# gem "webhookdb-enterprise", git: "https://github.com/webhookdb/webhookdb-enterprise.git", ref: "main"

# You only need these if you want to run integration tests.
# Set BUNDLE_WITHOUT=nonproduction in production to avoid loading these.
group :nonproduction do
  gem "faker", "~> 3.2"
  gem "fluent_fixtures", "~> 0.11"
  gem "rspec", "~> 3.12"
  gem "rspec-eventually", "~> 0.2"
end
