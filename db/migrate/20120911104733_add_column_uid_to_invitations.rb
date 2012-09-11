class AddColumnUidToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :uid, :string
  end
end
