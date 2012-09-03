class AddIndexToUidClassrooms < ActiveRecord::Migration
  def change
  	add_index :classrooms, :uid
  end
end
