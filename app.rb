# frozen_string_literal: true

require_relative 'lib/cli/messages'
require_relative 'lib/presenters/error_presenter'
require_relative 'lib/parser'

class App
  include CLI::Messages
  include Presenters::ErrorPresenter

  def start!
    check_input_argv
    new_report!
  end

  private

  attr_reader :file_path

  def check_input_argv
    wrong_msg if ARGV.count != 1 || ARGV.empty?
    help_msg  if ARGV.include?('-h' || '--help')
    @file_path = ARGV.first
  end

  def new_report!
    in_progress_msg

    begin
      results = Parser.new(file_path: file_path).call
    rescue StandardError => e
      error_rendering e.message

      help_msg
    end

    print_results(results)
  end

  def print_results(results)
    results.each { |result| puts result.report }
  end
end
