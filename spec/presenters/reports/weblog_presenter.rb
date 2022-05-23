# frozen_string_literal: true

require_relative '../../../lib/presenters/reports/weblog_presenter'

RSpec.describe Presenters::Reports::WeblogPresenter, type: :module do
  subject(:instance) { Class.new.include(described_class).new }
  let(:key) { '/index ' }
  let(:value) { %w[1 2 3] }

  context '#most_view_line(key, value)' do
    it 'returns correct message about visits' do
      expect(instance.most_view_line(key, value))
        .to eq("/index 3 visits\n")
    end
  end

  context '#most_uniq_view_line(key, value)' do
    it 'returns correct message about unique visits' do
      expect(instance.most_uniq_view_line(key, value))
        .to eq("/index 3 unique views\n")
    end
  end
end
