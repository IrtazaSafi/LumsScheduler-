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
	And I follow "Umaira Sajjad"
	Then I should be on the user home page for "Usman Nadeem"
	And I should see "Umaira Sajjad" and "User's Friends"
Scenario: Cannot add oneself (sad path)
	And I follow "Add New Friend"
	Then I should be on the display users page
	And I follow "Usman Nadeem"
	Then I should be on the user home page for "Usman Nadeem"
	And I should see "Cannot add Friend!"