class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
    	t.integer 		:amount
    	t.references 	:user
    	t.references	:breakpoint
    end
    add_index :pledges, [:user_id, :breakpoint_id], unique: true
  end
end
