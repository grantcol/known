class Member < ActiveRecord::Base
	belongs_to :group
	belings_to :user
end
