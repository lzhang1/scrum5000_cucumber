Given /^I open the test page$/ do
	$autotest.navigate_to()		
end

Given /^I input user "([^"]+)" and password "([^"]+)"$/ do |username, password|
	$autotest.login_action(username, password)
end

When /^I click "([^*]+)" button$/ do |button|
	$autotest.click(button)
end

Then /^"([^"]+)" to login the page$/ do |status|
	@result=$autotest.is_validate()
	if status == "succeed"
		@result[:result].should be_true, "Passed"
	else
		@result[:result].should be_false, "Failed"
	end
end

Then /^the content of page should content "([^*]+)"$/ do |content|
	@result[:response].include?(content)
end
