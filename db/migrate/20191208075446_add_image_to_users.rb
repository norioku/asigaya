class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :string
  end
  
  def change
    add_column :users, :profile, :text
  end
  
end
