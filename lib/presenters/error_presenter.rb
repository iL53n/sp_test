# frozen_string_literal: true

module Presenters
  module ErrorPresenter
    def error_rendering(message)
      if message.empty?
        puts 'Something wrong!'
      else
        puts "Error: #{message}\n---"
      end
    end
  end
end
