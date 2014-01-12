class FixChannelIdNameInLinks < ActiveRecord::Migration
  def change
  	rename_column :links, :channel_ids, :channel_id
  end
end
