require 'poker_rank'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
