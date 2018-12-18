class AddDevelopmentQualityToInterpretations < ActiveRecord::Migration[5.2]
  def change
    add_column :interpretations, :development_quality, :string
  end
end
