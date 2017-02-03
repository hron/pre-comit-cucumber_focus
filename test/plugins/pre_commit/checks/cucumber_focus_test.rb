=begin
Copyright 2017 Aleksei Gusev aleksei.gusev@gmail.com

See the file LICENSE for copying permission.
=end

require 'minitest_helper'
require 'plugins/pre_commit/checks/cucumber_focus'

describe PreCommit::Checks::CucumberFocus do
  let(:check){ PreCommit::Checks::CucumberFocus.new(nil, nil, []) }

  it "ignores files if they don't ends with .feature" do
    check.call([fixture_file("ruby-source.rb")]).must_equal(nil)
  end

  it "ignores features files without @focus tag" do
    check.call([fixture_file("no-focus.feature")]).must_equal(nil)
  end

  it "return error list if a feature file contains @focus tag" do
    check.call([fixture_file("file-with-focused-scenario.feature")]).to_s.must_equal("\
@focus found in features:
test/files/file-with-focused-scenario.feature:3:  @focus")
  end
end
