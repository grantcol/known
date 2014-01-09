class GroupsController < ApplicationController

	def index 
		@group = Group.all
	end

	def new 
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.save
		flash.notice = "#{@group.name} created!"
		redirect_to links_path(@group)
	end

	def add 
		#for adding a new member
	end

	def remove 
		#for removing a user
	end
end
