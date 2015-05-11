class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name,:string
  	add_column :users, :last_name,:string
  	add_column :users,:about,:text
  	add_column :users,:gender,:string
  	add_column :users,:work,:string
  	add_column :users,:email,:string
  	add_column :users,:education,:string
  end
end

