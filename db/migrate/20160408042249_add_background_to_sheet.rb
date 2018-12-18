class AddBackgroundToSheet < ActiveRecord::Migration[5.2]
  def change
    add_column :sheets, :background, :string
  end
end
