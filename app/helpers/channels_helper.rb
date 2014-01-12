module ChannelsHelper
	def channels_params
		params.require(:channel).permit(:name, :topics, :description, :user_id)
	end
end
