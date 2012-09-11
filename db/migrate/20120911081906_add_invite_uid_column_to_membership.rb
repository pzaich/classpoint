class AddInviteUidColumnToMembership < ActiveRecord::Migration
  def change
  	add_column :memberships, :invite_uid, :string
  end
end
