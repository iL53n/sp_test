# frozen_string_literal: true

require_relative 'base_file_validator'

module Validators
  class FileReadable < BaseFileValidator
    def validate!
      raise Errors::InvalidFile unless File.readable?(file_path)
    end
  end
end
