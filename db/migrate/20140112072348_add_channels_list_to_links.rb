class AddChannelsListToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :channel_ids, :string
  end
end
