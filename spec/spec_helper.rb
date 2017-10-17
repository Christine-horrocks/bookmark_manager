
ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', './lib/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rspec'

require_relative './features/web_helpers'

Capybara.app = Rock_Paper_Scissors

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end