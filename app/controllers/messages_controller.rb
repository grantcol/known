class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end

	def show
		@message = Message.find(params[:id])
	end

	def new 
		@message = Message.new
	end

	def create
		@message = current_user.messages.create(messages_params)
		@message.save
		redirect_to messages_path
	end
end
