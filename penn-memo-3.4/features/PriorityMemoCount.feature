Feature: Priority Memo Notification

	As an user of Penn Memo
	I want to implement the function of priority memo notification
	So that the functional of important memo notification count correctly

	Scenario: Show correct number of priority memos on mainpage
		Given I'm on the main page of penn memo without any notification
	 	When I add a new priority memo
	 	Then I should be able to see there is a priority memo in the priority memo list page
	  	Then I should be able to see the notification of you have one priority memo

	Scenario: Show cumulative number of priority memos on mainpage
		Given I'm on the main page of penn memo with 1 priority memo notification
	 	When I add a new priority memo based on 1 priority memo exists
	 	Then I should be able to see there are 2 priority memo in the priority memo list page
	  	Then I should be able to see the notification of you have two priority memo