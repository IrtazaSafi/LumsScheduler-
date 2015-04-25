class UsersController < ApplicationController

	def index
		@currUser = User.find_by_id(session[:user_id])
		@allevents = @currUser.events
		


	end


end