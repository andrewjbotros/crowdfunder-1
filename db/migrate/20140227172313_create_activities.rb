class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to  :user, index: true
      t.string      :action
      t.references  :trackable, polymorphic: true

      t.timestamps
    end
  end
end
