# frozen_string_literal: true

require_relative '../validators/line_not_empty'
require_relative '../validators/line_match'
require_relative 'constants'

module Parsers
  class Weblog
    DEFAULT_FILE_VALIDATORS = [Validators::LineNotEmpty, Validators::LineMatch].freeze

    def initialize(file_path:)
      @file_path = file_path
      @hash_data = parsing_file
    end

    def to_hash!
      hash_data
    end

    private

    attr_reader :file_path, :hash_data

    def parsing_file
      parsed_hash = {}

      File.foreach(file_path) do |line|
        line_valid?(line)

        webpage = line[WEBPAGE_FORMAT]
        ip      = line[IP_FORMAT]

        (parsed_hash[webpage] ||= []).push(ip)
      end

      parsed_hash
    end

    def line_valid?(line)
      # TODO: need a better implementation of line validation
      validators = DEFAULT_FILE_VALIDATORS.map { |validator| validator.new(line: line) }
      validators.each(&:validate!)
    end
  end
end
