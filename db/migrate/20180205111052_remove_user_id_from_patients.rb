class RemoveUserIdFromPatients < ActiveRecord::Migration[5.2]
  def change
    remove_column :patients, :user_id, :integer
  end
end
