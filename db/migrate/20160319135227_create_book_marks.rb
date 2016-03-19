class CreateBookMarks < ActiveRecord::Migration
  def change
    create_table :book_marks do |t|
    	t.references :user
    	t.references :list
    	t.timestamps
    end
  end
end
