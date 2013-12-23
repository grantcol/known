class UsersController < ApplicationController
	include UsersHelper

	def index 
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		flash.notice = "#{@user.handle} created"
		redirect_to users_path(@user)
	end

	def auth
		
	end

	def destroy
		#placeholder
	end
end
