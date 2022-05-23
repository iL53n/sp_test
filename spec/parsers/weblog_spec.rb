# frozen_string_literal: true

require_relative '../../lib/parsers/weblog'

RSpec.describe Parsers::Weblog, type: :class do
  subject { described_class.new(file_path: file_path) }

  context 'where file contains valid data' do
    let(:file_path) { 'spec/fixtures/webserver_test.log' }

    context '#to_hash!' do
      it 'returns instance of hash' do
        expect(subject.to_hash!).to be_a(Hash)
      end

      it "doesn't return raise error" do
        expect { subject.to_hash! }.to_not raise_error
      end
    end

    context '#parsing_file' do
      let(:expected_hash) do
        {
          '/first ' => %w[100.000.000.000 100.000.000.000 100.000.000.111],
          '/pages/1 ' => %w[100.000.000.333],
          '/second ' => %w[100.000.000.222 100.000.000.222]
        }
      end

      it 'returns instance of hash' do
        expect(subject.send(:parsing_file)).to be_a(Hash)
      end

      it 'returns correct hash' do
        expect(subject.send(:parsing_file)).to eq(expected_hash)
      end
    end
  end
end
