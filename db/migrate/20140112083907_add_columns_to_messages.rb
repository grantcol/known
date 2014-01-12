class AddColumnsToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :sender_id, :integer
  	add_column :messages, :recipient_id, :integer
  	add_column :messages, :link_id, :integer
  	add_column :messages, :text, :string 
  end
end
