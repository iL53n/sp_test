# frozen_string_literal: true

require_relative '../../lib/reports/most_views'
require_relative 'shared_examples_for_reports'

RSpec.describe Reports::MostViews, type: :class do
  it_behaves_like 'reports' do
    let(:description) { " visits\n" }
    let(:expected_report) do
      "/three 4 visits\n"\
      "/two 3 visits\n"\
      "/one 2 visits\n"\
    end
  end
end
