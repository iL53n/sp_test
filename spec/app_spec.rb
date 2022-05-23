# frozen_string_literal: true

require_relative '../app'

RSpec.describe App, type: :class do
  let(:start_cmd) { 'bin/parse' }
  let(:file_path) { 'spec/fixtures/webserver_test.log' }

  describe 'CLI start program' do
    context 'when there are args' do
      it 'shows In progress message' do
        expect { system %(#{start_cmd} #{file_path}) }
          .to output(/In progress/).to_stdout_from_any_process
        expect { system %(#{start_cmd} #{file_path}) }
          .to_not output(/Wrong number of arguments/).to_stdout_from_any_process
      end

      it 'shows reports content' do
        expect { system %(#{start_cmd} #{file_path}) }
          .to output(/visits/).to_stdout_from_any_process
        expect { system %(#{start_cmd} #{file_path}) }
          .to output(/unique/).to_stdout_from_any_process
      end
    end

    context 'if there are no args' do
      it 'shows Error message' do
        expect { system %("#{start_cmd}" ) }
          .to output(/Wrong number of arguments/).to_stdout_from_any_process
        expect { system %("#{start_cmd}") }
          .to_not output(/In progress/).to_stdout_from_any_process
      end

      context 'if wrong number of args' do
        it 'shows Error message' do
          expect { system %("#{start_cmd}" one two three) }
            .to output(/Wrong number of arguments/).to_stdout_from_any_process
          expect { system %("#{start_cmd}" one two three) }
            .to_not output(/In progress/).to_stdout_from_any_process
        end
      end
    end

    context 'if args include -h or --help' do
      it 'shows help menu' do
        expect { system %("#{start_cmd}" -h ) }
          .to output(/This is the help menu/).to_stdout_from_any_process
        expect { system %("#{start_cmd}" --help) }
          .to output(/This is the help menu/).to_stdout_from_any_process
      end
    end
  end
end
