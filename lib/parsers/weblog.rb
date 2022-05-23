# frozen_string_literal: true

module Parsers
  class Weblog
    WEBPAGE_FORMAT = %r{^/\w+...\s}
    IP_FORMAT = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

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
        webpage = line[WEBPAGE_FORMAT]
        ip      = line[IP_FORMAT]

        (parsed_hash[webpage] ||= []).push(ip)
      end

      parsed_hash
    end
  end
end
