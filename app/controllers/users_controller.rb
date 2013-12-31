class UsersController < ApplicationController
	def index 
		@users = User.all
	end

	#def new
		#@user = User.new
	#end

	#def create
	#	@user = User.new(user_params)
	#	@user.save
	#	flash.notice = "#{@user.handle} created"
	#	redirect_to users_path(@user)
	#end

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to root_url, :notice => "Signed up!"
	  else
	    render "new"
	  end
	end
end
