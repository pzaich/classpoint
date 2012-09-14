class AddClassroomIdIndexAndUserIdIndexToQuestions < ActiveRecord::Migration
  def change
  	add_index :questions, [:user_id, :classroom_id]
  end
end
