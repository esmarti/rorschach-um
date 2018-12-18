class AddSheetReferencesToAreas < ActiveRecord::Migration[5.2]
  def change
    add_reference :areas, :sheet, index: true
  end
end
