# frozen_string_literal: true

module Errors
  class InvalidFile < StandardError
    def message
      'Invalid file or file path!'
    end
  end
end
