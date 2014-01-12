class AddChannelsListToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :channel_ids, array: true, default: [], :integer
  end
end
