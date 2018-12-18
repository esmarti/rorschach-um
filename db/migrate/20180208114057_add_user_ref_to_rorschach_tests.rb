class AddUserRefToRorschachTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :rorschach_tests, :user, index: true
  end
end
