# frozen_string_literal: true

require_relative 'base_file_validator'

module Validators
  class FileNotEmpty < BaseFileValidator
    def validate!
      raise Errors::InvalidFile if File.empty?(file_path)
    end
  end
end
