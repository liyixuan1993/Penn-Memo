Feature: Sign up page

	As a normal user in Penn Memo
	I want to create a normal user account 
	So that I can create a normal account correctly

	Scenario: Sign up for a new account
		Given I'm on the sign up page
	 	When I sign up with every needed information
	  	Then I should be able to create a new normal account

	Scenario: Sign up for a new account without password confirmation
		Given I'm on the sign up page
		When I sign up with wrong passwords
		Then I should not be able to create a new normal account

	Scenario: Sign up for a new account without Email
		Given I'm on the sign up page
		When I sign up without Email
		Then I should not be able to create a new normal account without Email

