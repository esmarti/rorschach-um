class AddAllowedInterpretationToAreas < ActiveRecord::Migration[5.2]
  def change
    add_reference :areas, :allowed_interpretation, foreign_key: true
  end
end
