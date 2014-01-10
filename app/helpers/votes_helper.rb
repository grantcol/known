module VotesHelper
	
	def vote_params
		params.require(:vote).permit(:yn)
	end
end
