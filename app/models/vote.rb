class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :link
	validates :user_id, presence: true
	validates :link_id, presence: true

	def upvote
	end

	def downvote
	end
end
