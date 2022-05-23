# frozen_string_literal: true

module CLI
  module Messages
    def in_progress_msg
      puts 'In progress...'
    end

    def wrong_msg
      puts "Wrong number of arguments (expect 1).\n---"
      help_msg
    end

    def help_msg
      puts 'This is the help menu.'
      puts 'Commands:'
      puts '  bin/parse [file_path]   # Reporter of webpages with most page views '
      puts 'Options:'
      puts '  -h, --help              Display this help menu.'

      exit
    end
  end
end
