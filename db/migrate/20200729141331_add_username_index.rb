class AddUsernameIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :customers, :username, unique: true
  end
end
