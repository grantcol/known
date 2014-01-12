class LinksController < ApplicationController
	include LinksHelper

	protect_from_forgery :secret => 'biscuits',  
	                     :except => [ :recieve, :updateExtension ]

	def new 
		@link = Link.new
	end

	def create
		#@link = Link.new(link_params)
		#@link.user_id = current_user
		@link = current_user.links.build(link_params)
		@link.save
		flash.notice = "#{@link.title} added to the link box"
		redirect_to links_path
	end
	
	def index
		#@link = Link.all
	    #if signed_in?
	      @link  = current_user.links.build
	      @feed_items = current_user.feed
	    #end
	end

	def recieve
		@link = Link.new(:title    => params[:title], 
						 :url      => params[:url], 
						 :tag_list => params[:tag_list],
						 :user_id  => current_user)
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

	def vote
		@link = Link.find(params[:id])
		@yn = @link.votes.create!(user_id: current_user.id , yn: params[:yn])
		if @yn == true
			@link.score.increment
		else
			@link.score.decrement
		@link.save
		redirect_to :action => 'index'
	end
end
