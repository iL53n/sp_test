# frozen_string_literal: true

module Presenters
  module Reports
    module WeblogPresenter
      def most_view_line(key, value)
        "#{key}#{value.count} visits\n"
      end

      def most_uniq_view_line(key, value)
        "#{key}#{value.uniq.count} unique views\n"
      end
    end
  end
end
