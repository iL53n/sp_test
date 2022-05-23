# frozen_string_literal: true

require_relative '../../lib/cli/messages'

RSpec.describe CLI::Messages, type: :module do
  subject(:instance) { Class.new.include(described_class).new }

  let(:in_progress_msg) { "In progress...\n" }
  let(:wrong_msg) { "Wrong number of arguments (expect 1).\n---\n" }
  let(:help_msg) do
    "This is the help menu.\n"\
    "Commands:\n"\
    "  parse.rb [file_path]   # Reporter of webpages with most page views \n"\
    "Options:\n"\
    "  -h, --help             Display this help menu.\n"
  end

  context 'show correct messages' do
    it '#in_progress_msg' do
      expect { instance.in_progress_msg }
        .to output(in_progress_msg).to_stdout
    end

    it '#wrong_msg' do
      expect { instance.wrong_msg }
        .to output(wrong_msg + help_msg).to_stdout
    end

    it '#help_msg' do
      expect { instance.help_msg }
        .to output(help_msg).to_stdout
    end
  end
end
