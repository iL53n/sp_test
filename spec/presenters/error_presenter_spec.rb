# frozen_string_literal: true

require_relative '../../lib/presenters/error_presenter'

RSpec.describe Presenters::ErrorPresenter, type: :module do
  subject(:instance) { Class.new.include(described_class).new }
  let(:message) { 'I am error message!' }

  describe '#error_rendering' do
    context 'when message is not empty' do
      it 'returns message with argument' do
        expect { instance.error_rendering(message) }
          .to output("Error: #{message}\n---\n").to_stdout
      end
    end

    context 'when message is empty' do
      it 'returns general error message' do
        expect { instance.error_rendering('') }
          .to output("Something wrong!\n").to_stdout
      end
    end
  end
end
