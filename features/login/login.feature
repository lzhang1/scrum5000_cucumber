Feature: test login
	Scenario: test login page
		Given I open the test page 
		Given I input user "lzhang@redhat.com" and password "rayzhang13"
		When I click "commit" button
		Then "succeed" to login the page
		And the content of page should content "Welcome to"
