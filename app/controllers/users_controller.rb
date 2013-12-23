class UsersController < ApplicationController
	
	def index 
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(:first    => params[:first],
						 :last     => params[:last],
						 :email    => params[:email],
						 :handle   => params[:handle],
						 :password => params[:password]);
		@user.save
		redirect_to users_path
	end

	def auth
		
	end

	def destroy
		#placeholder
	end
end
