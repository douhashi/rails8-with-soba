# frozen_string_literal: true

require "webmock/rspec"

# Allow localhost connections for testing
WebMock.disable_net_connect!(allow_localhost: true)
