class AddUidToClassrooms < ActiveRecord::Migration
  def change
  	add_column :classrooms, :uid , :string
  end
end
