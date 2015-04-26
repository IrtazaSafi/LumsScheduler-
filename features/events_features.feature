Feature: Add, edit, delete, view events
As a User
So I can manage my events
I should be able to add, edit, delete abd view my events

Background: 
 	
 	Given I am on the User home page 

Scenario: Existing user should be able to Add their own events
	When I follow 'Add New Event'
	Then I should be on the 'Add new Events Page'
	When I fill in 'Name' with 'My Birthday' 
	And  I fill in 'Date' with 25th January
	And I press 'Add Event'
	Then I should be on my User home page
	And I should see 'Event : My Birthday  added , Date : 25th January'

Scenario: Existing user should be able to View details of their own events
	When I Follow 'Zirak's Birthday'
	Then I should be on the 'Event details  page'
	And I should see '1st July'

Scenario: Existing user should be able to Edit event information
	When I Follow 'Zirak's Birthday'
	Then I should be on the 'Event details' page
	When I follow 'Edit Event'
	Then I should be on the Edit event page
	When I fill in 'Date' with '10th July'
	And I press 'Submit Changes'
	Then I should be on the User home page
	And I should see 'Details Updated'


Scenario: Existing user should be able to delete any event
	When I follow 'Zirak's Birthday
	Then I should be on the 'Event details' page
	And I press 'Delete Event'
	Then I should be on the User home page
	And I should not see 'Zirak's Birthday'

Scenario: Events should be visible as scrollable list on user home page
	Then I should see 'Zirak's Birthday' 
	And I should see 'My Birthday'