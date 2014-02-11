class PhotosController < ApplicationController
	def index
		@photos=Photo.all
	end
	def new
		@photo=Photo.new

	end
	def create
		@photo=Photo.new(params[:photo])   
	   	if @photo.save
	      flash[:notice]="photo created scuccessfully"
	      redirect_to photos_url    
	    else
	      flash[:error]="photo not created"
	      render "new"
	    end
	end
	def show
	   	@photo=Photo.find(params[:id])
	end
	def destroy
		@photo = Photo.find(params[:id])
		render :text=>@photo.inspect and return false

	end
end

