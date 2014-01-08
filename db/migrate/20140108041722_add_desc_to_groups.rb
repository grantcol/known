class AddDescToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :desc, :string
  end
end
