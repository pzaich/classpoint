class AddIndexToInvitations < ActiveRecord::Migration
  def change
  	add_index :invitations, :classroom_id
  end
end
