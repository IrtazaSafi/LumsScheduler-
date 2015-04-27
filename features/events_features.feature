Feature: Add, edit, delete, view events
As a User
So I can manage my events
I should be able to add, edit, delete abd view my events

Background: events on user page

	Given the following users exist:
		| name | uid |
		| Usman Nadeem | 1 |

	And I am on the user home page for "Usman Nadeem"
	And the following events exist:
	 	| title            | description  |
	 	| Zirak's Birthday | 1st July     |
	 	| My birthday      | 25th January |

Scenario: Existing user should be able to Add their own events
	When I follow "Add New Event"
	Then I should be on the Add new Events page
	When I fill in "Title" with "My Birthday" 
	And I press "Create Event"
	Then I should be on the user home page for "Usman Nadeem"
	And I should see "My Birthday"

Scenario: Existing user should be able to View details of their own events
	When I follow "Zirak's Birthday"
	Then I should be on the Event details  page
	And I should see "1st July"
