class AddLinkRefToTaggings < ActiveRecord::Migration
  def change
  	add_reference :taggings, :link, index: true
  end
end
