class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :channel
	validates :user_id, presence: true
	validates :channel_id, presence: true
	attr_accessible :user_id, :channel_id
end
