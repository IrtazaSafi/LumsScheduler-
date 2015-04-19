

Feature: User can Sign Up on the Home Page

Background: Events in database
 
  Given the following events exist:
  | Name         		| Start time | End Time     | Date         | 				Note             |
  | Zirak's Birthday    | 1:00 pm    | 12:00 am 	| 1-1-1990     |		   None					 |
  | Momina's Birthday	| 1:00 pm    | 12:00 am 	| 2-1-1990	   |	       None					 |
 

Scenario: Sign Up with Facebook
	Given I am on the LumsScheduler Home Page
	When I follow 'Sign up with Facebook'
	Then I should be redirected to Provider's permission page



Scenario: Existing User should be able to Login
	Given I am on the LumsScheduler home page
	When I fill in 'Username' with 'Safi' and 'Password' with 'Safi'
	And I follow 'Login'
	Then I should be on my User home page 
	And I should see 'Login Successful , Signed In as Safi' 



Scenario: Existing user should be able to Add their own events
	Given I am on my User home page 
	When I follow 'Add New Event'
	Then I should be on the 'Add new Events Page'
	When I fill in 'Name' with 'My Birthday' 
	And  I fill in 'Date' with 25th January
	And I press 'Add Event'
	Then I should be on my User home page
	And I should see 'Event : My Birthday  added , Date : 25th January'



Scenario: Existing user should be able to View details of their own events
	Given I am on my User home page
	When I Follow 'Zirak's Birthday'
	Then I should be on the 'Event details  page'
	And I should see '1st July'


Scenario: Existing user should be able to Edit event information
	Given I am on my User home page
	When I Follow 'Zirak's Birthday'
	Then I should be on the 'Event details' page
	When I follow 'Edit Event'
	Then I should be on the 'Edit event page'
	When I fill in 'Date' with '10th July'
	And I press 'Submit Changes'
	Then I should be on my User home page
	And I should see 'Details Updated'


Scenario: Existing user should be able to delete any event
	Given I am on my user home page
	When I follow 'Zirak's Birthday
	Then I should be on the 'Event details' page
	And I press 'Delete Event'
	Then I should be on my user home page
	And I should not see 'Zirak's Birthday'



Scenario: User should be able to log out
	Given I am on my user home page
	When I follow 'Logout'
	Then I should be on the 'LumsScheduler home page'
	And I should see 'Logged Out'

Scenario: Events should be visible as scrollable list on user home page
	Given I am on my user home page 
	Then I should see 'Zirak's Birthday' 
	And I should see 'My Birthday'



