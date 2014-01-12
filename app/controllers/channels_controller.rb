class ChannelsController < ApplicationController
	include ChannelsHelper
	def new
		@channel = Channel.new
	end

	def create 
		@channel = Channel.new(channels_params)
		@channel.save
	end

end
