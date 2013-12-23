class AddRecipIdToPosts < ActiveRecord::Migration
  def change
  	add_column :links, :recip_id, :integer
  end
end
