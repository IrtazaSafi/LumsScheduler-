class UsersController < ApplicationController

	def show
		@currUser = User.find_by_id(params[:id])
		# session[:user_id] = params[:id]
		if @currUser != nil
			@allevents = @currUser.events
			@friends = @currUser.friends
		else
			flash[:notice] = "No such user"
			redirect_to user_path session[:user_id]
		end
		#random coommmetn
	end

	def view
		
		@currUser = User.find_by_id(params[:id])
		if(@currUser == nil)
			flash[:notice] = "No such user"
			redirect_to user_path session[:user_id]
		end

	end

	def displayUsers
		@allusers = User.all
	end
	def addFriend
		temp = User.find_by_name(params[:name]);
		currUser = User.find_by_id(session[:user_id])
		if temp.name == currUser.name
			flash[:notice] = "Cannot add Friend!"
			redirect_to displayUsers_path session[:user_id]
			return
		end
		currUser.friends.each { |x| 
			if x.name == temp.name
				flash[:notice] = "Cannot add Friend!"
				redirect_to displayUsers_path session[:user_id]
				return
			end
		}
		Friend.create!({:uid => temp.uid, :provider=>temp.provider, :name=>temp.name,:first_name=>temp.first_name,:last_name=>temp.last_name,:about=>temp.about,:gender=>temp.gender,:work=>temp.work,:email=>temp.email,:education=>temp.education,:user_id => session[:user_id]});
		
		flash[:notice] = "Friend Added!! #{temp.name}"
		redirect_to user_path session[:user_id]
	end

	def showFriend


	end

	def setMeeting
		currUser_events  = User.find_by_id(params[:id]).events
		otherUser_events = User.find_by_name(params[:friend_id]).events
		curDate = params[:curr_date]

		year = curDate[6] + curDate[7] + curDate[8]+ curDate[9]
		month = curDate[3] + curDate[4]
		day = curDate[0] + curDate[1]
		@currDate = day + "/" + month + "/" + year
		today_events = []
		free_time = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
		
		currUser_events.each { |x|
			if x.starttime.day.to_s == day && x.endtime.day.to_s == day
				today_events << x
			end
		}
		otherUser_events.each { |x| 
			if x.starttime.day.to_s == day && x.endtime.day.to_s == day
				today_events << x
			end
		}
		#VFDJVJKDFJVKJDFJV
		# logger.debug("TODAYS EVENTS: ")
		# logger.debug(today_events)
		today_events.each do |x|
			((x.starttime.hour.to_i) .. (x.endtime.hour.to_i)).each do |i| 
				# logger.debug("SEE THIS BITCHES")
				# logger.debug(i)
				free_time[i] = false
			end
		end
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