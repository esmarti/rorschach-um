class AddRorschachTestRefToInterpretations < ActiveRecord::Migration[5.2]
  def change
    add_reference :interpretations, :rorschachTest, index: true
  end
end
