class AddLinkIdToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :link_id, :integer
  end
end
