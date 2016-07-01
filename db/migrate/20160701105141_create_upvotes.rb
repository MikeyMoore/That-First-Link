class CreateUpvotes < ActiveRecord::Migration
  def change
  	create_table :upvotes do |t|
  		t.integer :post_id
  		t.integer :user_id

  		t.timestamps
  	end
  end
end
