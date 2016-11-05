Feature: New Post page

	As a web developer Nursing Organizational Communication App
	I want to the website to have characteristics of showing important messages
	So that they have a better experience

	Scenario: Add a new post 
		Given I'm on the add New Post page
	 	When I add a new post
	  	Then I should be able to see a new post has been successfully created

	Scenario: Add a new post without author  
		Given I'm on the add New Post page
	 	When I add a new post without author
	  	Then I can't create a new post without author

	Scenario: Add a new post without title  
		Given I'm on the add New Post page
	 	When I add a new post without title
	  	Then I can't create a new post without title

	Scenario: Add a new post without content  
		Given I'm on the add New Post page
	 	When I add a new post without content
	  	Then I can't create a new post without content

	Scenario: Add a new post with content smaller than 10 charaters
		Given I'm on the add New Post page
		When I add a new post with content smaller than 10 characters
		Then I can't create a new post
