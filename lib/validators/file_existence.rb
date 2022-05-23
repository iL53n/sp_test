# frozen_string_literal: true

require_relative 'base_file_validator'

module Validators
  class FileExistence < BaseFileValidator
    def validate!
      raise Errors::InvalidFile unless File.exist?(file_path)
    end
  end
end
