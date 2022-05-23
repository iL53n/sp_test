# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  # TODO: need another way... have fake specs
  config.around(:example) do |ex|
    ex.run
  rescue SystemExit #=> e
    # puts "Got SystemExit: #{e.inspect}. Ignoring"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
