class ChannelsController < ApplicationController
	include ChannelsHelper
	def index 
		@channels = Channel.all
	end 

	def new
		@channel = Channel.new
	end

	def create 
		@channel = current_user.channels.build(channels_params)
		@channel.save
		redirect_to channel_path(@channel)
	end

	def show
		@channel = Channel.find(params[:id])
	end
end
