class RecieverController < ApplicationController
	def create 
		@post = Post.new;
		@post.title = "An Ajax Post"
		@post.subtitle = "From our extension"
		@post.body = "Some link will go here!"
		@post.save
	end
end
