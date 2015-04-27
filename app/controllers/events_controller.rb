class EventsController < ApplicationController

def new
	

end

def create
	#params[:event][:duration] = params[:event][:endtime] - params[:event][:startime]
	params[:event][:user_id] = session[:user_id]
	@event = Event.create!(params[:event])
	flash[:notice] = "New Event Created"
	redirect_to  user_path session[:user_id]
end

def show
	@event = Event.find_by_id(params[:id])
end
def update
	@event = Event.find_by_id params[:id]
    @event.update_attributes!(params[:event])
    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to user_path session[:user_id]
end

def destroy
	@event = Event.find_by_id(params[:id])
	@event.destroy
	flash[:notice] = "Event '#{@event.title}' deleted."
    redirect_to user_path session[:user_id]
end
def edit
    @event = Event.find_by_id params[:id]
end






end
