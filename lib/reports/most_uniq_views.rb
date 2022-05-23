# frozen_string_literal: true

require_relative 'views'

module Reports
  class MostUniqViews < Views
    private

    def new_report
      sort_by_count  { |_key, value| value.uniq.count }
      prepare_report { |key, value| @report += most_uniq_view_line(key, value) }
    end
  end
end
