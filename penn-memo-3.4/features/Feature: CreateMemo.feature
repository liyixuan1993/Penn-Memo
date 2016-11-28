Feature: Create New Memo

	As an admin user of Penn Memo
	I want to create a new memo
	So that the functional of creating memo works correctly

	Scenario: Add a new Tag 
		Given I'm on the add New Tag page
	 	When I add a new Tag
	  	Then I should be able to see a successfully created tag message
	  	Then I can choose the tag exists in the new memo creation page

	Scenario: Add a new post   
		Given I'm on the add new post page
	 	When I add a new post 
	  	Then I create a new post successfully


	Scenario: Add a new post without author  
		Given I'm on the add new post page
	 	When I add a new post without author
	  	Then I can't create a new post without author

	Scenario: Add a new priority post
		Given I'm on the add new post page
		When I add a new priority post
		Then I should be able to see a priority post

	

