Feature: User can log in and log out 

As a user
So that I can schedule my events
I should be able to log in and log out of the application

Scenario: Sign Up with Facebook
	Given I am on the LumsScheduler home page
	And I press 'Sign up with Facebook'
	Then I should be on the Provider's permission page


Scenario: Existing User should be able to Login
	Given I am on the Provider's permission page
	When I fill in 'Username' with 'Safi' and 'Password' with 'Safi'
	And I press 'Login'
	Then I should be on the User's home page 

Scenario: User should be able to log out
	Given I am on the User's home page
	And I press 'Logout'
	Then I should be on the LumsScheduler home page