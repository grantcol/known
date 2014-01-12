class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :user_id
      t.string  :name
      t.string  :description
      t.string  :topics, array: true, default: []
      t.timestamps
    end
  end
end
