Feature: User can log in and log out 

As a user
So that I can schedule my events
I should be able to log in and log out of the application

Background: Given the following users exist:
	| name | uid |
	| Usman Nadeem | 1 |
	| Umaira Sajjad | 3 |

Scenario: User should be able to log in
	Given I am on the LumsScheduler home page
	When I follow "SignUp/Login with Facebook"
	Then I should be on the User's home page

Scenario: User should be able to log out
	Given I am on the user home page for "Usman Nadeem"
	And I press "Logout"
	Then I should be on the LumsScheduler home page