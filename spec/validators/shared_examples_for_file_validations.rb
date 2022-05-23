# frozen_string_literal: true

RSpec.shared_examples 'file_validations' do
  subject { described_class.new(file_path: file_path) }

  context '#validate!' do
    context 'where file is valid' do
      let(:file_path) { 'spec/fixtures/webserver_test.log' }

      it 'no raise error' do
        expect { subject.validate! }.not_to raise_error
      end
    end

    context 'where file invalid' do
      let(:file_path) { invalid }

      it 'returns raise error' do
        expect { subject.validate! }
          .to raise_error(error)
      end
    end
  end
end
