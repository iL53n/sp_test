# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser, type: :class do
  let(:file_path)               { 'spec/fixtures/webserver_test.log' }
  let(:most_view_standard)      { File.read('spec/fixtures/most_views_report.txt') }
  let(:most_uniq_view_standard) { File.read('spec/fixtures/most_uniq_views_report.txt') }

  subject(:output) { described_class.new(file_path: file_path).call }

  context 'returns output' do
    it 'contains correct reports' do
      report = ''
      expect_report = most_view_standard + most_uniq_view_standard

      output.each do |obj|
        report += obj.report
      end
      expect(report).to eq(expect_report)
    end
  end
end
