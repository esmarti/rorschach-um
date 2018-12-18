class CreateJoinTableAreaZone < ActiveRecord::Migration[5.2]
  def change
    create_join_table :areas, :zones do |t|
      t.index [:area_id, :zone_id]
      t.index [:zone_id, :area_id]
    end
  end
end
