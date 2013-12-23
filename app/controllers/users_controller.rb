class UsersController < ApplicationController
	
	def index 
		@user = User.all
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
	end

	def auth
		
	end

	def destroy
		#placeholder
	end
end
