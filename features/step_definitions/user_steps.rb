Given /the following users exist/ do |user_table|
	user_table.hashes.each do |temp|
		User.create temp		
		# User.create_with_omniauth temp		
	end
end

And /the following friends exist/ do |user_table|
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
# Then I should not see "Usman Nadeem" on the screen
# Then /I should not see "(.*)"/ do |e1|
# 	page.body.should_not include("#{e1}")
# end
# Then /I should see "(.*)"/ do |e1|
# 	page.body.should include("#{e1}")
# end

When(/^I follow 'Go!'$/) do
  click_button('Go!')
  #pending # express the regexp above with the code you wish you had
end

