class AddBbbToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :bbb, :integer
  end
end
