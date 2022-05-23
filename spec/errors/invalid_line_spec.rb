# frozen_string_literal: true

require_relative '../../lib/errors/invalid_line'

RSpec.describe Errors::InvalidLine do
  it 'shows correct message' do
    expect { raise Errors::InvalidLine }
      .to raise_error('The file contains invalid data (invalid line format, empty lines etc.)')
  end
end
