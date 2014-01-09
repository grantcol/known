class GroupsController < ApplicationController
	include GroupsHelper
	
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
		redirect_to groups_path
	end

	def add 
		#for adding a new member
	end

	def remove 
		#for removing a user
	end
end
