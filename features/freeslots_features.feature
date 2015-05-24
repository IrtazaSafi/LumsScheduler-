Feature: View free events
As a User
So I can schedule events with my friend
I should be able to see all free available time slots with my friend's and my schedules.
Background: events on user page

	Given the following users exist:
		| name          | uid |
		| Usman Nadeem  | 1   |
		| Umaira Sajjad | 2   |
		| Irtaza Safi   | 3   |

	And the following events exist for "Irtaza Safi"
	 	| title            | description  | ownerid | starttime | endtime |
	 	| Software viva    | 17th May     | 2       | 14:30     | 15:00   |
	 	| Mgmt exam        | 17th May     | 2       | 16:00     | 17:00   |

	And the following events exist for "Usman Nadeem":
	 	| title            | description  | ownerid | starttime | endtime |	                 								  
	 	| Software viva    | 17th May     | 1       | 14:30     | 15:00   |					 				
	 	| Automata exam    | 17th May     | 1       | 08:00     | 11:00   |

	And  I am on the user home page for "Usman Nadeem"

	And the following friends exist for "Usman Nadeem"
		| name          | uid |
		| Irtaza Safi   | 3   |

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
	And I follow "Irtaza Safi"
	Then I should be on the find free slots page
	When I fill in "curr_date" with "17-05-2015"
	And I follow 'Go!'
	Then I should be on the view free slots page
	And I should see "18:00 - 23:00"