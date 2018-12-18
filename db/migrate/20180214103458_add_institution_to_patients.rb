class AddInstitutionToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :institution, :string
  end
end
