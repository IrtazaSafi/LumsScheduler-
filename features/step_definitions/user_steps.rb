Given /the following users exist/ do |user_table|
	user_table.hashes.each do |temp|
		User.create temp
		Event.create!(
			:title => "Zirak's Birthday",
			:description => "1st July")
		Event.create!(
			:title => "My birthday",
			:description => "25th January")
	end
end

Given /the following friends exist/ do |user_table|
	user_table.hashes.each do |temp|
		Friend.create temp
	end
end
And /the following events exist/ do |events_table|
	events_table.hashes.each do |event|
		Event.create event
	end
end
# Given(/^the following events exist for "(.*?)"/) do |arg1, events_table|
# 	events_table.hashes.each do |event|
# 		Event.create event
# 	end
# end

# And /the following events exist for "(.*?)"/ do |arg1, events_table|
# 	events_table.hashes.each do |event|
# 		Event.create event
# 	end
# end
When(/^I follow "(.*?)" whereby the logged in user is "(.*?)"$/) do |arg1, arg2|
	temp = User.find_by_name(arg1);
	currUser = User.find_by_name(arg2)
	# if temp.name == currUser.name
	# else 		
	# 	Friend.create!({:uid => 2, :name=> "Umaira Sajjad"});
	# end
end
Then /I should see "(.*?)" on the screen/ do |e1|
	e1 = "Cannot add Friend!"
end
Then(/^I should see "(.*?)" on my screen$/) do |arg1|
  arg1 = "Friend Added!!"
end
