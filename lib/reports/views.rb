# frozen_string_literal: true

require_relative '../presenters/reports/weblog_presenter'

module Reports
  class Views
    include Presenters::Reports::WeblogPresenter

    attr_reader :parser, :report, :sorted_hash

    def self.new_report(parser:)
      new(parser).call
    end

    def initialize(parser)
      @parser = parser
      @sorted_hash = {}
      @report = ''
    end

    def call
      new_report
      self
    end

    def sort_by_count(&block)
      @sorted_hash = hash_data.sort_by(&block).reverse.to_h
    end

    def prepare_report(&block)
      sorted_hash.each(&block)
    end

    private

    def hash_data
      # {"/first "=>["100.000.000.000", "100.000.000.000", ...}
      parser.to_hash!
    end
  end
end
