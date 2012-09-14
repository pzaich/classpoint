class RemoveColumnViewsFromQuestions < ActiveRecord::Migration
  def up
  	remove_column :questions, :views
  end

  def down
  end
end
