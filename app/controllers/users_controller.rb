class UsersController < ApplicationController
	# before_filter :login_checking
	# def login_checking
	#   if session[:user]
 #      @user=session[:user]
 #    else
	#   	flash[:notice]="login required"c/simul
	#   	render :login
	#   end
	# end

	def login
    redirect_to root_url and return false if session[:user]    
    if params[:email] and params[:password]      
      @user = User.check_password(params[:email],params[:password])
      if @user.present?
        flash[:notice] ="login successfully"
        session[:user] = @user
        redirect_to root_url
      else
        flash[:error] ="Invalid credentials"
        render :login      
      end
    end    
	end

	# def authenticate_user
	# 	redirect_to users_path and return false if session[:user]
	# 	if params[:email] and params[:password]
	# 		@user=User.first(:select=>"id,name,email",:conditions=>["email=? AND password=?",params[:email],params[:password]])
	# 		if @user
	# 			flash[:notice] ="login successfully"
	# 			session[:user] = @user
	# 			redirect_to products_url
	# 		else
	# 			flash[:error] = "login failed"
	# 			render :login
	# 		end
	# 	else
	# 		flash[:error] ="Invalid credentials"
	# 		render :login
	# 	end
 # 	end

 	def logout
 		session[:user]=nil
 		redirect_to users_url
 	end

  def index
  	@users=User.find(:all)
  end
  def new
  	@user=User.new
  end
  def create
  	
  	@user=User.new(params[:user])
  	if @user.save
  		flash[:notice]="user create successufully"
  		redirect_to users_url
  	else
  		flash[:notice]="user not created"
  		render :new
  	end
  end
  def edit
  	@user=User.find(params[:id])
  end
  def update
  	@user=User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:notice]="user updated successufully"
  		redirect_to users_url
  	else
  		flash[:notice]="user not updated successufully"
  		render :edit
  	end
  end
  def show
  	@user=User.find(params[:id])
  end
 def destroy
  	
    @user=User.find(params[:id])
    if @user.destroy
      flash[:notice] ="record successfully deleted"
    else
      flash[:error] ="record not deleted"
    end
    redirect_to users_url
  end
end
