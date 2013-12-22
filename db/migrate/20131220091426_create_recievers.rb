class CreateRecievers < ActiveRecord::Migration
  def change
    create_table :recievers do |t|

      t.timestamps
    end
  end
end
