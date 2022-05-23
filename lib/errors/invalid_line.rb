# frozen_string_literal: true

module Errors
  class InvalidLine < StandardError
    def message
      'The file contains invalid data (invalid line format, empty lines etc.)'
    end
  end
end
