class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :address
      t.integer :favorites_count
      t.string :image_id
      t.integer :user_id
      t.timestamps
    end
  end
end
