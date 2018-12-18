class AddPatientRefToRorschachTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :rorschach_tests, :patient, index: true
  end
end
