class RemoveSenderRecieverFromLinks < ActiveRecord::Migration
  def change
  	remove_column :links, :recip_id, :integer
  	remove_column :links, :owner_id, :integer
  end
end
