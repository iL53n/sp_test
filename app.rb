# frozen_string_literal: true

class App
  WEBPAGE_FORMAT = %r{^/\w+...\s}
  IP_FORMAT = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

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

    new_report!
  end

  def new_report!
    puts 'In progress'

    parsed_hash = {}

    File.foreach(file_path) do |line|
      webpage = line[WEBPAGE_FORMAT]
      ip      = line[IP_FORMAT]

      (parsed_hash[webpage] ||= []).push(ip)
    end

    parsed_hash.each do |key, value|
      most_view_line(key, value)
      most_uniq_view_line(key, value)
    end
  end

  def most_view_line(key, value)
    puts "#{key}#{value.count} visits\n"
  end

  def most_uniq_view_line(key, value)
    puts "#{key}#{value.uniq.count} unique views\n"
  end
end
