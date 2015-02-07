#!/usr/bin/env ruby
require 'watir-webdriver'
require 'pry'
require 'pry-nav'
require 'rspec/expectations'
$LOAD_PATH << File.dirname(__FILE__)
class Actions
	def navigate_to()
		$browser.goto('http://127.0.0.1:3000/users/sign_in')
	end

	def login_action(username, password)
		$browser.text_field(:tag_name => "user_email",:type=>'email').wait_until_present
		$browser.text_field(:tag_name => "user_email",:type=>'email').flash
		$browser.text_field(:tag_name => "user_email",:type=>'email').set username
		$browser.text_field(:tag_name => "user_password",:type=>'password').wait_until_present
		$browser.text_field(:tag_name => "user_password",:type=>'password').flash
		$browser.text_field(:tag_name => "user_password",:type=>'password').set password
	end
	
	def click(buttonname)
		$browser.button(:tag_name => buttonname).click
		sleep(1)
	end

	def is_validate()
		result={}
		result[:response]=$browser.text
		result[:result]=$browser.assert_exists
		return result
	end
end
