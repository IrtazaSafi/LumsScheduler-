class SessionsController < ApplicationController
  def new
  end

  def create
  	auth=request.env["omniauth.auth"]
    user=User.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      User.initialize(auth['provider'],auth['uid'],auth['info']['name'])

    #user.save!
    #session[:user_id] = user.uid

    if (user == nil)
    	puts "USER IS NILL"
    end

    flash[:notice] = "Welcome #{user}'"
    redirect_to start_path
  end

  def failure
  end

  def destroy
  end
end
