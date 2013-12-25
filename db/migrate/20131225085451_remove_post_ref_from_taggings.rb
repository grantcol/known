class RemovePostRefFromTaggings < ActiveRecord::Migration
  def change
  	remove_reference :taggings, :post_id
  end
end
