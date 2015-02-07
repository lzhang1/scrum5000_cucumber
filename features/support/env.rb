#encoding=UTF-8
begin 
	require 'rspec/expectations'; 
rescue LoadError; 
	require 'spec/expectations'; 
end
require 'cucumber/formatter/unicode'
require 'watir-webdriver'
require 'watir-webdriver-performance'
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../../lib")
require 'Action'
require 'pry'
require 'pry-nav'

Before do
$browser=Watir::Browser.new :firefox
$autotest=Actions.new
end

After do 
$browser.close
end
