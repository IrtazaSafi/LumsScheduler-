class AddDetailsToFriends < ActiveRecord::Migration
  def change
  	add_column :friends,:first_name,:string
  	add_column :friends,:last_name,:string
  	add_column :friends,:about,:text
  	add_column :friends,:gender,:string
  	add_column :friends,:work,:string
  	add_column :friends,:email,:string
  	add_column :friends,:education,:string
  	add_column :friends,:name,:string
  	add_column :friends,:provider,:string
  	add_column :friends,:uid,:string
  end
end
