=begin
Copyright 2017 Aleksei Gusev aleksei.gusev@gmail.com

See the file LICENSE for copying permission.
=end

require 'pre-commit/error_list'
require 'pre-commit/checks/plugin'
require 'pre-commit/checks/grep'

# :nodoc:
module PreCommit
  # :nodoc:
  module Checks

    #
    # Finds cucumber scenarios with with specific tags (e.g. @focus)
    #
    class CucumberFocus < Grep
      def files_filter(staged_files)
        staged_files.grep(/\.feature$/)
      end

      def message
        "@focus found in features:"
      end

      def pattern
        "@focus"
      end

      def self.description
        "Finds cucumber scenarios with '@focus'."
      end

    end

  end
end
