class RemoveEndUserIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :end_user_id, :integer
  end
end
