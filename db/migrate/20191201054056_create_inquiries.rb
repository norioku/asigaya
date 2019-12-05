class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.text :content
      t.text :reply
      t.string :states

      t.timestamps
    end
  end
end
