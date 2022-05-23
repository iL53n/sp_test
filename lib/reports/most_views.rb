# frozen_string_literal: true

require_relative 'views'

module Reports
  class MostViews < Views
    private

    def new_report
      sort_by_count  { |_key, value| value.count }
      prepare_report { |key, value| @report += most_view_line(key, value) }
    end
  end
end
