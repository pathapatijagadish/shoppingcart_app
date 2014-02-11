module ApplicationHelper
	def current_user
		s = ''		
		if session[:user].present?
			s += "<p> Login as #{session[:user][:email]} "
			s += link_to("logout",user_logout_path)
			s += " "
			s += image_tag(session[:user].avatar.url(:thumb),:size=>"50x50") if session[:user].avatar.present? 
			s += "</p>"
			s += "<p>"
			s += link_to("Categories",categories_path)
			s += " "
			s += link_to("Products",products_path)
			s += "</p>"			
		else
			s += "<p>"
			s += link_to("Login",user_login_path)
			s += link_to("SignUp",new_user_path)
			s += "</p>"
		end
		s.html_safe		
	end
end
