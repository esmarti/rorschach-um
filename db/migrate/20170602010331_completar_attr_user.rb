class CompletarAttrUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :given_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :licence_number, :string
  	add_column :users, :institution, :string
  	add_column :users, :phone, :string
  end
end
