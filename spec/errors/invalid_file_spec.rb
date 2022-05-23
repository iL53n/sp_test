# frozen_string_literal: true

require_relative '../../lib/errors/invalid_file'

RSpec.describe Errors::InvalidFile do
  it 'shows correct message' do
    expect { raise Errors::InvalidFile }
      .to raise_error('Invalid file or file path!')
  end
end
