class UsersController < ApplicationController
	def show
		@currUser = User.find_by_id(params[:id])
		@allevents = @currUser.events
		@friends = @currUser.friends
	end

	def view
		
		@currUser = User.find_by_id(params[:id])
		# if(@currUser == nil)
		# 	flash[:notice] = "No such user"
		# 	redirect_to user_path session[:user_id]
		# end

	end

	def displayUsers
		currUser = User.find_by_id(params[:id])
		@allusers = User.notYetFriends(currUser)
	end

	def addFriend
		# friend_to_add = User.find_by_name(params[:name]);
		# currUser = User.find_by_id(params[:id])
		# Friend.create!({:uid => friend_to_add.uid, :provider=>friend_to_add.provider, 
		# 	:name=>friend_to_add.name,:first_name=>friend_to_add.first_name,
		# 	:last_name=>friend_to_add.last_name,:about=>friend_to_add.about,
		# 	:gender=>friend_to_add.gender,:work=>friend_to_add.work,
		# 	:email=>friend_to_add.email,:education=>friend_to_add.education,
		# 	:user_id => params[:id]});
		
		data_of_friend = Friend.getHash (params[:name])
		data_of_friend[:user_id] = params[:id]
		Friend.create!(data_of_friend)
		flash[:notice] = "Friend Added!! #{params[:name]}"
		redirect_to user_path params[:id]
	end

	def showFriend


	end

	def setMeeting
		currUser_events  = User.find_by_id(params[:id]).events
		otherUser_events = User.find_by_name(params[:friend_id]).events
		all_events = currUser_events + otherUser_events
		curDate = params[:curr_date]

		year = curDate[6] + curDate[7] + curDate[8]+ curDate[9]
		month = curDate[3] + curDate[4]
		day = curDate[0] + curDate[1]
		@currDate = day + "/" + month + "/" + year
		today_events = []
		free_time = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
		
		# currUser_events.each { |x|
		# 	if x.starttime.day.to_s == day && x.endtime.day.to_s == day
		# 		today_events << x
		# 	end
		# }
		# otherUser_events.each { |x| 
		# 	if x.starttime.day.to_s == day && x.endtime.day.to_s == day
		# 		today_events << x
		# 	end
		# }
		all_events.each { |event| 
			if event.starttime.day.to_s == day && event.endtime.day.to_s == day
				todays_event = event
				((todays_event.starttime.hour.to_i) .. (todays_event.endtime.hour.to_i)).each do |i| 
					free_time[i] = false
				end
			end
		}
		#VFDJVJKDFJVKJDFJV
		# logger.debug("TODAYS EVENTS: ")
		# logger.debug(today_events)
		# today_events.each do |x|
		# 	((x.starttime.hour.to_i) .. (x.endtime.hour.to_i)).each do |i| 
		# 		# logger.debug("SEE THIS BITCHES")
		# 		# logger.debug(i)
		# 		free_time[i] = false
		# 	end
		# end
		@free_slots = []
		for i in 0..23
				if free_time[i] == true
					@free_slots << i
				end
		end
		temp = ""
		# logger.debug("FREE_SLOTSSS")
		# logger.debug(@free_slots)
		# logger.debug(@free_slots.size)
		@free_slots_two = []
		for i in 0..(@free_slots.size-1)
			if i == 0
				temp = @free_slots[i].to_s + ":00 - "
			end
			# logger.debug("@free_slots[i] + 1 :")
			# logger.debug(@free_slots[i] + 1)
			# logger.debug("@free_slots[i+1]  :")
			# logger.debug(@free_slots[i+1])
				
			if @free_slots[i+1] != (@free_slots[i]+1)
				temp = temp + @free_slots[i].to_s + ":00"
				@free_slots_two << temp
				temp = @free_slots[i+1].to_s + ":00 - "
			end
		end
	end
end
