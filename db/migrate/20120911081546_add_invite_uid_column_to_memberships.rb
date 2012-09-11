class AddInviteUidColumnToMemberships < ActiveRecord::Migration
  def change
  	add_column :memberships, :invite_uid, :integer
  end
end
