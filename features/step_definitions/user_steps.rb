Given /the following users exist/ do |user_table|
	user_table.hashes.each do |temp|
		User.create temp
	end
end
And /the following events exist/ do |events_table|
	events_table.hashes.each do |event|
		Event.create event
	end
end

