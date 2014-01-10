class VotesController < ApplicationController
	include VotesHelper
	
	def new
		@vote = Vote.new 
	end

	def create 
		@vote = current_user.votes.build(vote_params)
		@vote.save
		redirect_to link_path
	end
end
