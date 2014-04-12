require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'poker_rank'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
