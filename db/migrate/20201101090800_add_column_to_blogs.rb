class AddColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :author_name, :string
  end
end
