# frozen_string_literal: true

require_relative '../../lib/validators/line_not_empty'

RSpec.describe Validators::LineMatch do
  it_behaves_like 'line_validations' do
    let(:valid)   { '/first 100.000.000.000' }
    let(:invalid) { '' }
    let(:error)   { Errors::InvalidLine }
  end
end
