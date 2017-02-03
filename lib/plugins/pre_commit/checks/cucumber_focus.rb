=begin
Copyright 2017 Aleksei Gusev aleksei.gusev@gmail.com

See the file LICENSE for copying permission.
=end

require 'pre-commit/error_list'
require 'pre-commit/checks/plugin'

# :nodoc:
module PreCommit
  # :nodoc:
  module Checks

    #
    # Finds cucumber scenarios with with specific tags (e.g. @focus)
    #
    class Cucumber_focus < Plugin

      #
      # description of the plugin
      #
      def self.description
        "Finds cucumber scenarios with with specific tags (e.g. @focus)"
      end

      #
      # Finds files and verify them
      #
      # @param staged_files [Array<String>] list of files to check
      #
      # @return [nil|Array<PreCommit::ErrorList>] nil when no errors,
      #                                           list of errors otherwise
      def call(staged_files)
        errors = staged_files.map { |file| run_check(file) }.compact
        return if errors.empty?

        errors
      end

    private

      #
      # Finds cucumber scenarios with with specific tags (e.g. @focus)
      #
      # @param file [String] path to file to verify
      #
      # @return [nil|PreCommit::ErrorList] nil when file verified,
      #                                    ErrorList when verification failed
      #
      def run_check(file)
        if
          true # add a check here to verify files
        then
          nil
        else
          PreCommit::ErrorList.new(PreCommit::Line.new("Describe why verification failed", file))
        end
      end

    end

  end
end
