class AddAreaRefToAllowedInterpretations < ActiveRecord::Migration[5.2]
  def change
    add_reference :allowed_interpretations, :area, foreign_key: true
  end
end
