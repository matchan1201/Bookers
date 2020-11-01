class AddSssToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :aaa, :integer
  end
end
