Feature: Add friends
As a User
So I can view friend's schedule
I should be able to add a User as a friend

Background: 

	Given the following users exist:
		| name          | uid | email				    |
		| Usman Nadeem  | 1   |						    |
		| Umaira Sajjad | 2   |						    |
		| Irtaza Safi   | 3   | irtaza_safi@hotmail.com |

	And  I am on the user home page for "Usman Nadeem"	
	And I follow "Add New Friend"
	Then I should be on the display users page

Scenario: Add a friend (happy path)
	When I follow "Umaira Sajjad" 
	Then I should be on the user home page for "Usman Nadeem"
	And I should see "Friend Added!!"
Scenario: Cannot add oneself (sad path)
	Then I should not see "Usman Nadeem"