class AddEmailToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :email, :string
    add_column :inquiries, :user_name, :string
  end
end
