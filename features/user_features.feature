Feature: View User info
As a User
So I can view my user info
I should be able to see user profile information obtained from facebook

Background:

	Given the following users exist: 
		| name          | uid | email				    |
		| Usman Nadeem  | 1   |						    |
		| Umaira Sajjad | 2   |						    |
		| Irtaza Safi   | 3   | irtaza_safi@hotmail.com |

Scenario: View Detailed User Info(happy path)
And I am on the user home page for "Irtaza Safi"
And I follow "Irtaza Safi"
Then I should be on the user details page
And I should see "irtaza_safi@hotmail.com"