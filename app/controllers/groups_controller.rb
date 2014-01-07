class GroupsController < ApplicationController

	def index 
		@group = Groups.all
	end

	def create
		@group = Groups.new
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
