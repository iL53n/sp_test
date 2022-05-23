# frozen_string_literal: true

RSpec.shared_examples 'reports' do
  let(:parser) { instance_double('Parsers::Weblog') }
  before do
    allow(parser).to receive(:to_hash!).and_return(
      {
        '/two ' => %w[1 2 2],
        '/one ' => %w[1 1],
        '/three ' => %w[1 2 3 3]
      }
    )
  end
  subject(:reporter) { described_class.new_report(parser: parser) }

  it "returns instance of #{described_class}" do
    expect(reporter).to be_a(described_class)
  end

  it 'includes variable @report with expected report' do
    expect(reporter.report).to eq(expected_report)
  end

  describe 'methods' do
    let(:key)         { 'key ' }
    let(:value)       { %w[1 2 3] }
    let(:sorted_hash) do
      {
        '/three ' => %w[1 2 3 3],
        '/two ' => %w[1 2 2],
        '/one ' => %w[1 1]
      }
    end

    context '#hash_data' do
      it 'returns hash' do
        expect(reporter.send(:hash_data)).to be_a(Hash)
      end
    end

    context '#sort_by_count' do
      it { expect { |b| reporter.sort_by_count(&b) }.to yield_successive_args(*reporter.send(:hash_data)) }
    end

    context '#prepare_report' do
      it { expect { |b| reporter.prepare_report(&b) }.to yield_successive_args(*sorted_hash) }
    end
  end
end
