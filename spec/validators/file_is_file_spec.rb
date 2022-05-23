# frozen_string_literal: true

require_relative '../../lib/validators/file_is_file'
require_relative 'shared_examples_for_file_validations'

RSpec.describe Validators::FileIsFile do
  it_behaves_like 'file_validations' do
    let(:invalid) { 'spec/fixtures' } # folder
    let(:error)   { Errors::InvalidFile }
  end
end
