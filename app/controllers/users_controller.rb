class UsersController < ApplicationController

	def show
		@currUser = User.find_by_id(params[:id])
		session[:user_id] = params[:id]
		if @currUser != nil
			@allevents = @currUser.events
		end
	end
end