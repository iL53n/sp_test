# frozen_string_literal: true

require_relative '../../lib/validators/file_not_empty'
require_relative 'shared_examples_for_file_validations'

RSpec.describe Validators::FileNotEmpty do
  it_behaves_like 'file_validations' do
    let(:invalid) { 'spec/fixtures/empty.log' }
    let(:error)   { Errors::InvalidFile }
  end
end
