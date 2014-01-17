class TagsController < ApplicationController

	def index
		@tag = Tag.all.paginate(:page => params[:page], :per_page => 26)
	end

	def show
  		@tag = Tag.find(params[:id])
	end
end
