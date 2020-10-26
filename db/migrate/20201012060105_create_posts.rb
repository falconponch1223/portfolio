class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :image_id
      t.string :name
      t.integer :genre
      t.integer :mood
      t.integer :use
      t.integer :participant
      t.integer :type
      t.integer :private
      t.integer :smoking
      t.string :phone_number
      t.string :postal_number
      t.string :address
      t.text :introduce

      t.timestamps
    end
  end
end
