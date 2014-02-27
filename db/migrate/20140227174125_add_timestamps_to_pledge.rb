class AddTimestampsToPledge < ActiveRecord::Migration
  def change
    add_timestamps :pledges
  end
end
