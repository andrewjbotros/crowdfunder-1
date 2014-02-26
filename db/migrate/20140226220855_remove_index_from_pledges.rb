class RemoveIndexFromPledges < ActiveRecord::Migration
  def change
    remove_index :pledges, [:user_id, :breakpoint_id]
  end
end
