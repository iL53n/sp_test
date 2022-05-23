# frozen_string_literal: true

require_relative 'lib/parsers/weblog'
require_relative 'lib/reports/most_views'
require_relative 'lib/reports/most_uniq_views'

class App
  WEBPAGE_FORMAT = %r{^/\w+...\s}
  IP_FORMAT = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

  def start!
    check_input_argv
  end

  private

  attr_reader :file_path

  def check_input_argv
    if ARGV.count != 1 || ARGV.empty?
      puts 'Wrong number of arguments'

      exit
    end

    if ARGV.include?('-h') || ARGV.include?('--help')
      puts 'This is the help menu'

      exit
    end

    @file_path = ARGV.first

    new_report!
  end

  def new_report!
    puts 'In progress'

    parsed_hash = Parsers::Weblog.new(file_path: file_path)

    output = []
    output << Reports::MostViews.new_report(parser: parsed_hash)
    output << Reports::MostUniqViews.new_report(parser: parsed_hash)
    output.each { |report| puts report.report}
  end
end
