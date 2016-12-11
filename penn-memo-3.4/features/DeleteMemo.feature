Feature: Delete Memo

	As an admin user of Penn Memo
	I want to a memo
	So that the functional of delete memo works correctly

	Scenario: Delete memo 
		Given I'm on the main page of penn memo
	 	When I click on delete link of a certain memo
	  	Then I should be able to see a successfully deleted memo message

	  	