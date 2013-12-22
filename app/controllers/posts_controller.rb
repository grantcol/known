class PostsController < ApplicationController
	include PostsHelper

	protect_from_forgery :secret => 'biscuits',  
	                     :except => :recieve

	def index 
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new 
		@post = Post.new
	end

	def create 
		@post = Post.new(post_params)
		@post.save
		flash.notice = "#{@post.title} created"
		redirect_to posts_path(@post)
	end

	# Reciever for links from extension land
	def recieve
		@post = Post.new(:title    => params[:title], 
						 :subtitle => params[:url], 
						 :body     => params[:subtitle])
		@post.save
	end

	def updateExtension
		#placeholder
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		flash.notice = "#{@post.title} updated"
		redirect_to posts_path(@post)
  	end

	def destroy 
		@post = Post.find(params[:id])
		@post.destroy
		flash.notice = "#{@post.title} trashed"
		redirect_to posts_path
	end
end
