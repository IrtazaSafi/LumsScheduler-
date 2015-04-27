class SessionsController < ApplicationController
 
  def checklogin
  	if session[:user_id] == nil
	    redirect_to login_path
	    return
  	else 
  		redirect_to user_path session[:user_id]
  		return
	end
  end

  def login
  	@numUsers = User.all.size
  	flash[:notice] = "Total users = #{@numUsers}"
  end

  def create
  	auth=request.env["omniauth.auth"]
    user=User.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      User.create_with_omniauth(auth)

    puts "CLASS OF USER IS #{user.class}"
    session[:user_id] = user.id


    #flash[:notice] = "Welcome #{user.id} AND #{user.name}"
    redirect_to user_path user.id
  end

  def failure
  end

  def destroy
  	session.delete(:user_id)
  	flash[:notice] = 'Logged out Successfully'
  	redirect_to start_path
  end
end
