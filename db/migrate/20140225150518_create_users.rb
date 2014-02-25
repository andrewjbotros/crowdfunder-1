class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true, unique: true
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
