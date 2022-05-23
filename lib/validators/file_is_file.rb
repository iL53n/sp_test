# frozen_string_literal: true

require_relative 'base_file_validator'

module Validators
  class FileIsFile < BaseFileValidator
    def validate!
      raise Errors::InvalidFile unless File.file?(file_path)
    end
  end
end
