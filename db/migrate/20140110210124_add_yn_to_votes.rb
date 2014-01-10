class AddYnToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :yn, :boolean
  end
end
