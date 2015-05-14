Feature: View free events
As a User
So I can schedule events with my friend
I should be able to see all free available time slots with my friend's and my schedules.
Background: events on user page

	Given the following users exist:
		| name | uid |
		| Usman Nadeem | 1 |
		| Umaira Sajjad | 2 |

	And I am on the user home page for "Usman Nadeem"
	And the following events exist:
	 	| title            | description  | ownerid |
	 	| Zirak's Birthday | 1st July     | 1       |
	 	| My birthday      | 25th January | 1       |

Scenario: Add a friend (happy path)
	And I follow "Add New Friend"
	Then I should be on the display users page
	When I follow "Umaira Sajjad" whereby the logged in user is "Usman Nadeem"
	Then I should be on the main user page for "Usman Nadeem"
	And I should see "Friend Added!!" on my screen
Scenario: Cannot add oneself (sad path)
	And I follow "Add New Friend"
	Then I should be on the display users page
	When I follow "Usman Nadeem" whereby the logged in user is "Usman Nadeem"
	Then I should see "Cannot add Friend!" on the screen
Scenario: Find free slots (happy path)
