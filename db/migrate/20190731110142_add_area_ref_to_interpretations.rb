class AddAreaRefToInterpretations < ActiveRecord::Migration[5.2]
  def change
    add_reference :interpretations, :area, foreign_key: true
  end
end
