class SubscriptionsController < ApplicationController
	def create
	    @channel = Channel.find(params[:subscription][:channel_id])
	    current_user.subscribe(@channel)
	    redirect_to @channel
  	end

  	def destroy
  		@channel = Channel.find(params[:channel_id])
	    current_user.unsubscribe(@channel)
	    redirect_to @channel
  	end
end
