class UsersController < ApplicationController
	def index 
		@users = User.all.paginate(:page => params[:page], :per_page => 30)
	end

	def show
		@user = User.find(params[:id])
	end

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

	def following
	    @title = "Following"
	    @user = User.find(params[:id])
	    @users = @user.followed_users
	    render 'show_follow'
	end

	def followers
	    @title = "Followers"
	    @user = User.find(params[:id])
	    @users = @user.followers
	    render 'show_follow'
	end
end
