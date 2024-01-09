# frozen_string_literal: true

# Ensure the path is set up
lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Load configuration
require "webhookdb"
Webhookdb.load_app

# Run the web worker
require "webhookdb/apps"
Webhookdb::Apps.rack_up(self)
