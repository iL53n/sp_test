# frozen_string_literal: true

require_relative 'base_line_validator'

module Validators
  class LineMatch < BaseLineValidator
    def validate!
      raise Errors::InvalidLine unless line.match?(Validators::BaseLineValidator::LOG_FORMAT)
    end
  end
end
