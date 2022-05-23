# frozen_string_literal: true

require_relative '../../lib/validators/line_match'
require_relative 'shared_examples_for_line_validations'

RSpec.describe Validators::LineMatch do
  it_behaves_like 'line_validations' do
    let(:valid)   { '/first 100.000.000.000' }
    let(:invalid) { '/invalid111.111' }
    let(:error)   { Errors::InvalidLine }
  end
end
