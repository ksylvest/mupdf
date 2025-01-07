# frozen_string_literal: true

require 'simplecov'
require 'tempfile'

SimpleCov.start do
  enable_coverage :branch
end

require 'mupdf'

Dir.glob(File.join(__dir__, 'support', '**', '*.rb')).each { |file| require file }

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
