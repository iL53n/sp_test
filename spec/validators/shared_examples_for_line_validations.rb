# frozen_string_literal: true

RSpec.shared_examples 'line_validations' do
  subject { described_class.new(line: line) }

  context '#validate!' do
    context 'where line is valid' do
      let(:line) { valid }

      it 'no raise error' do
        expect { subject.validate! }.not_to raise_error
      end
    end

    context 'where line invalid' do
      let(:line) { invalid }

      it 'returns raise error' do
        expect { subject.validate! }
          .to raise_error(error)
      end
    end
  end
end
