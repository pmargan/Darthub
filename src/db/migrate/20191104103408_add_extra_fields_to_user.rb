class AddExtraFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_number, :string
    add_column :users, :street_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string

    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
