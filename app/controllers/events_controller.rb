class EventsController < ApplicationController

def new
	

end

def create
	#params[:event][:duration] = params[:event][:endtime] - params[:event][:startime]
	params[:event][:user_id] = session[:user_id]
	@event = Event.create!(params[:event])
	flash[:notice] = "New Event Created"
	redirect_to users_path
end






end
