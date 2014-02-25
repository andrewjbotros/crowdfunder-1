class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.integer    :amount
      t.text       :description
      t.references :project, index: true

      t.timestamps
    end
  end
end
