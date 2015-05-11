class UsersController < ApplicationController

	def show
		@currUser = User.find_by_id(params[:id])
		# session[:user_id] = params[:id]
		if @currUser != nil
			@allevents = @currUser.events
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
		Friend.create!(params[:uid => temp.uid, :provider=>temp.provider, :name=>temp.name,:first_name=>temp.first_name,:last_name=>temp.last_name,:about=>temp.about,:gender=>temp.gender,:work=>temp.work,:email=>temp.email,:education=>temp.education,:user_id => "1"]);
		
		currUser = User.find_by_id(session[:user_id])
		flash[:notice] = "Friend Added!! #{temp.name} #{currUser.friends.size}"
		# flash[:notice] = "Friend Added!! #{friend.name} #{currUser.friends.size}"
		redirect_to user_path session[:user_id]
	end
end