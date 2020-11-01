class AddColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :published_at, :string
  end
end
