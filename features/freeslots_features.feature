Feature: View free events
As a User
So I can schedule events with my friend
I should be able to see all free available time slots with my friend's and my schedules.
Background: events on user page

	Given the following users exist:
		| name          | uid |email				  |
		| Usman Nadeem  | 1   |						  |
		| Umaira Sajjad | 2   |						  |
		| Irtaza Safi   | 3   |irtaza_safi@hotmail.com|

	And  I am on the user home page for "Usman Nadeem"

	And the following events exist
	 	| title               | description    | ownerid | starttime               | endtime                 |	                 								  
	 	| Busy				  | 23rd May       | 1       | 2015-05-23 12:00:00 UTC | 2015-05-23 15:00:00 UTC |					 				
	 	| Exam           	  | 25th January   | 1       | 2015-01-25 08:00:00 UTC | 2015-01-25 11:00:00 UTC |

	And the following friends exist
		| name          | uid |user_id|
		| Irtaza Safi | 2|1|
 	
Scenario: Find free slots (happy path)
	Given I am on the user home page for "Usman Nadeem"
	And I follow "Irtaza Safi"
	Then I should be on the find free slots page
	When I fill in "curr_date" with "23-05-2015"
	And I follow 'Go!'
	Then I should be on the view free slots page
	And I should see "0:00 - 23:00"