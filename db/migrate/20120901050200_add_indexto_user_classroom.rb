class AddIndextoUserClassroom < ActiveRecord::Migration
  def up
  	add_index :user_classrooms, :classroom_id
  	add_index :user_classrooms, :user_id
  end

  def down
  end
end
