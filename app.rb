# frozen_string_literal: true

require_relative 'lib/parser'
require_relative 'lib/presenters/error_presenter'

class App
  def start!
    check_input_argv
    new_report!
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
  end

  def new_report!
    puts 'In progress'

    begin
      results = Parser.new(file_path: file_path).call
    rescue StandardError => e
      error_rendering e.message
    end

    print_results(results)
  end

  def print_results(results)
    results.each { |result| puts result.report }
  end
end
