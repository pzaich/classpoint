class AddIndexesToMemberships < ActiveRecord::Migration
  def change
  	add_index :memberships, :classroom_id
  	add_index :memberships, :user_id
  end
end
