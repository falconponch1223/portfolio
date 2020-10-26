class RemoveTypeFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :type, :integer
  end
end
