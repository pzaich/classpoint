class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :detail
      t.integer :classroom_id
      t.integer :user_id
      t.integer :views

      t.timestamps
    end
  end
end
