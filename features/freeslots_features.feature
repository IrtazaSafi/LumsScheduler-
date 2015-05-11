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
	And I type in "Umaira Sajjad"
	Then I should see "Umaira Sajjad" and "My Friends"
Scenario: Friend doesn't exist (sad path)
	And I follow "Add New Friend"
	And I type in "Zirak Zaheer"
	Then I should see "User does not exist!
Scenario: See free slots between my friend and mine
	And I see "Umaira Sajjad" 
	And I follow "Schedule a meeting"
	Then I should be on the add meeting page
	And I should not see "1st July"
