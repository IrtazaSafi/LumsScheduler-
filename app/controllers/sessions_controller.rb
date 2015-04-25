class SessionsController < ApplicationController
 
  def checklogin
  	if session[:user_id] == nil
	    redirect_to login_path
	    return
  	else 
  		redirect_to users_path
  		return
	end
  end

  def new
  	@numUsers = User.all.size
  	flash[:notice] = @numUsers
  end

  def create
  	auth=request.env["omniauth.auth"]
    user=User.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      User.create_with_omniauth(auth)

    puts "CLASS OF USER IS #{user.class}"
    session[:user_id] = user.id


    if (user == nil)
    	puts "USER IS NILL"

    end

    flash[:notice] = "Welcome #{user.id} AND #{user.name}"
    redirect_to users_path
  end

  def failure
  end

  def destroy
  	session.delete(:user_id)
  	flash[:notice] = 'Logged out Successfully'
  	redirect_to start_path
  end
end
