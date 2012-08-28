class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
end
