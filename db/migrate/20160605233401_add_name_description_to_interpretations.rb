class AddNameDescriptionToInterpretations < ActiveRecord::Migration[5.2]
  def change
    add_column :interpretations, :name, :string
    add_column :interpretations, :description, :string
  end
end
