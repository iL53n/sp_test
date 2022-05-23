# frozen_string_literal: true

require_relative '../../lib/reports/most_uniq_views'
require_relative 'shared_examples_for_reports'

RSpec.describe Reports::MostUniqViews, type: :class do
  it_behaves_like 'reports' do
    let(:description) { " unique views\n" }
    let(:expected_report) do
      "/three 3 unique views\n"\
      "/two 2 unique views\n"\
      "/one 1 unique views\n"\
    end
  end
end
