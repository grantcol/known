class LinksController < ApplicationController
	include LinksHelper

	protect_from_forgery :secret => 'biscuits',  
	                     :except => [ :recieve, :updateExtension ]

	def new 
		@link = Link.new
	end

	def create
		@link = Link.new(:title    => params[:title], 
						 :url      => params[:url], 
						 :tag_list => params[:tag_list])#Link.new(link_params)
		@link.save
		flash.notice = "#{@link.title} added to the link box"
		redirect_to links_path
	end
	
	def index
		@link = Link.all
	end

	def recieve
		@link = Link.new(:title    => params[:title], 
						 :url      => params[:url], 
						 :tag_list => params[:tag_list])
		@link.save
	end

	def updateExtension 
		@links = Link.all
		respond_to do |format|
			format.json { render :json =>  @links }
		end
	end

	def update 
		@link = Link.find(params[:id])
		@link.update(link_params)
		flash.notice = "#{@link.title} updated"
		redirect_to posts_path(@link)
	end

	def destroy
		@link = Link.find(params[:id])
		@link.destroy
		flash.notice = "#{@link.title} trashed"
		redirect_to links_path
	end
end
