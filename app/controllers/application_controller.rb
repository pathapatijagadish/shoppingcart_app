class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
  	if session[:user]
  		@user =session[:user] #User.find(session[:user][:id])
  	else
  		flash[:error] = "You are not allowed to authenticate this page ..!!!"
  		redirect_to user_login_path
  	end	
  end

end
