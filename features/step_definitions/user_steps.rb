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
And /the following events exist/ do |events_table|
	events_table.hashes.each do |event|
		Event.create event
	end
end

