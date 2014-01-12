class ChannelsController < ApplicationController
	include ChannelsHelper
	def index 
		@channels = Channel.all
	end 

	def new
		@channel = Channel.new
	end

	def create 
		@channel = Channel.new(channels_params)
		@channel.save
	end

	def show
		@channel = Channel.find(params[:id])
	end
end
