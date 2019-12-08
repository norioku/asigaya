class CreateLocationInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :location_informations do |t|

      t.timestamps
    end
  end
end
