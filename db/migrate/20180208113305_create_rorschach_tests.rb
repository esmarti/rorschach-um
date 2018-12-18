class CreateRorschachTests < ActiveRecord::Migration[5.2]
  def change
    create_table :rorschach_tests do |t|

      t.timestamps
    end
  end
end
