class RemoveColumnInviteUidFromMemberships < ActiveRecord::Migration
  def up
  	remove_column :memberships, :invite_uid
  end

  def down
  end
end
