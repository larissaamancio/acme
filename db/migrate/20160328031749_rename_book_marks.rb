class RenameBookMarks < ActiveRecord::Migration
    def self.up
    rename_table :book_marks, :bookmarks
  end

 def self.down
    rename_table :bookmarks, :book_marks
 end

end
