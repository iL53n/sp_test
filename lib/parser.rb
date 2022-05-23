# frozen_string_literal: true

require_relative 'validators/file_existence'
require_relative 'validators/file_is_file'
require_relative 'validators/file_readable'
require_relative 'validators/file_not_empty'

require_relative 'parsers/weblog'
require_relative 'reports/most_views'
require_relative 'reports/most_uniq_views'

class Parser
  DEFAULT_FILE_VALIDATORS = [
    Validators::FileExistence,
    Validators::FileIsFile,
    Validators::FileReadable,
    Validators::FileNotEmpty
  ].freeze

  attr_reader :file_path, :validators, :output

  def initialize(validator_classes = DEFAULT_FILE_VALIDATORS, file_path:)
    @file_path = file_path
    @validators = validator_classes.map { |validator| validator.new(file_path: @file_path) }
    @output = []
  end

  def call
    check_file_validity!

    log_parser = Parsers::Weblog.new(file_path: file_path)
    output << Reports::MostViews.new_report(parser: log_parser)
    output << Reports::MostUniqViews.new_report(parser: log_parser)
    output
  end

  private

  def check_file_validity!
    validators.each(&:validate!)
  end
end
