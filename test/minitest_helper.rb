=begin
Copyright 2017 Aleksei Gusev aleksei.gusev@gmail.com

See the file LICENSE for copying permission.
=end

if
  RUBY_VERSION == "2.0.0" # check Gemfile
then
  require "coveralls"
  require "simplecov"

  SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter,
    ]
    command_name "Spesc Tests"
    add_filter "/test/"
  end

  Coveralls.noisy = true unless ENV['CI']
end

require 'minitest/autorun'
require "minitest/reporters"
require 'minitest/around/spec'
require "mocha/setup"
require 'pluginator'

module PreCommit; module Helpers

  def fixture_file(filename)
    file_dir = File.expand_path('../files', __FILE__).sub("#{project_dir}/", "")
    File.join(file_dir, filename)
  end

  def test_files
    File.expand_path("../files", __FILE__)
  end

  def project_dir
    File.expand_path("../../", __FILE__)
  end

end; end

class MiniTest::Unit::TestCase
  include PreCommit::Helpers
end

Dir['lib/**/*.rb'].each { |file| require "./#{file}" } # coverals trick for all files

Minitest::Reporters.use!
