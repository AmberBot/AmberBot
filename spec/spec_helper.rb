$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'codeclimate-test-reporter'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  CodeClimate::TestReporter::Formatter
])

SimpleCov.start

require 'amberbot'
