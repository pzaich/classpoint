class DropUserClassrooms < ActiveRecord::Migration
  def up
  	drop_table :user_classrooms 
  end

  def down
  end
end
