class LinksController < ApplicationController

	protect_from_forgery :secret => 'biscuits',  
	                     :except => [ :recieve, :updateExtension ]

	def new 
		@link = Link.new
	end

	def create
		@link = Link.new(link_params)
		@link.save
		flash.notice = "#{@link.title} added to the link box"
		redirect_to links_path(@link)
	end
	
	def index
		@link = Link.all
	end

	def recieve
		@link = Link.new(:title => params[:title], 
						 :url   => params[:url], 
						 :tag_list => params[:tag_list])
		@link.save
	end

	def updateExtension 
		@links = Link.all
		respond_to do |format|
			format.json { render :json =>  @links }
		end
	end
end
