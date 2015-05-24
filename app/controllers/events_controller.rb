class EventsController < ApplicationController

def new
	@event = Event.new
	@event = Event.find_by_id(params[:id]);
	

end


def create
	#params[:event][:duration] = params[:event][:endtime] - params[:event][:startime]
	params[:event][:user_id] = session[:user_id]
	@temp = params[:event][:title]
	# logger.debug("VALUE OF TITLW: ")
	# logger.debug(params[:event][:title])

	if params[:event][:title] == ""
		#logger.debug("I AM IN THIS IF CONDITION BIATCHES")
		flash[:notice] = "Title field should not be empty!"
		redirect_to new_user_event_path(session[:user_id])
	#end 
	else 
		@event = Event.create!(params[:event])
		flash[:notice] = "New Event Created"
		redirect_to  user_path session[:user_id]
	end
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
