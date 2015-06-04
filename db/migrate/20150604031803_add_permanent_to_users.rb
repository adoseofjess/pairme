class AddPermanentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permanent, :boolean
  end
end
