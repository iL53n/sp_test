# frozen_string_literal: true

require_relative '../errors/invalid_line'
require_relative '../parsers/constants'

module Validators
  class BaseLineValidator
    # ex. /help_page/1 126.318.035.038
    LOG_FORMAT = "#{Parsers::WEBPAGE_FORMAT}#{Parsers::IP_FORMAT}".freeze

    attr_reader :line

    def initialize(line:)
      @line = line
    end

    def validate!; end
  end
end
