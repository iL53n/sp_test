# frozen_string_literal: true

require_relative '../../lib/validators/file_existence'
require_relative 'shared_examples_for_file_validations'

RSpec.describe Validators::FileExistence do
  it_behaves_like 'file_validations' do
    let(:invalid) { 'invalid_path' }
    let(:error)   { Errors::InvalidFile }
  end
end
