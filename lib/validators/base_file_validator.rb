# frozen_string_literal: true

require_relative '../errors/invalid_file'

module Validators
  class BaseFileValidator
    attr_reader :file_path

    def initialize(file_path:)
      @file_path = file_path
    end

    def validate!; end
  end
end
