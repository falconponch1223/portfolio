class AddSeatToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :seat, :integer
  end
end
