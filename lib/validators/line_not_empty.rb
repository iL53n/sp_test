# frozen_string_literal: true

require_relative 'base_line_validator'

module Validators
  class LineNotEmpty < BaseLineValidator
    def validate!
      raise Errors::InvalidLine if File.empty?(line)
    end
  end
end
