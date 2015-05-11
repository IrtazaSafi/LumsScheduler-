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
end