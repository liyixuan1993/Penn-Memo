Feature: Login and Logout page

	As a normal user in Penn Memo
	I want to login the account in Penn Memo
	So that I can see the Penn Memo page correctly

	Scenario: Login with an existing account
		Given I'm on the login page
	 	When I login with every needed information
	  	Then I should be able to see the main page of my account
	  	When I log out
	  	Then I should return to the welcome page
	

