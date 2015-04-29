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
	 	| title            | description  | ownerid |
	 	| Zirak's Birthday | 1st July     | 1       |
	 	| My birthday      | 25th January | 1       |

Scenario: Existing user should be able to add events
	When I follow "Add New Event"
	Then I should be on the Add new Events page
	When I fill in "Title" with "My Birthday" 
	And I press "Create Event"
	Then I should be on the user home page for "Usman Nadeem"
	And I should see "My Birthday"

Scenario: Events should be visible as scrollable list on user home page
	Then I should see "Zirak's Birthday" 
	And I should see "My birthday"

Scenario: Existing user should be able to Edit event information
	When I follow "Zirak's Birthday:
	Then I should be on the Event details page
	When I follow "Edit"
	Then I should be on the Edit event page
	When I fill in "Description" with "10th July"
	And I press "Edit Event'
	Then I should be on the user home page for "Usman Nadeem"
	And I should see "successfully updated"


Scenario: Existing user should be able to delete any event
	When I follow "Zirak's Birthday"
	Then I should be on the Event details page
	And I press "Delete"
	Then I should be on the user home page for "Usman Nadeem"
	And I should not see "Zirak's Birthday"

Scenario: Existing user should be able to View details of their own events
	When I follow "Zirak's Birthday"
	Then I should be on the Event details page
	And I should see "1st July"

