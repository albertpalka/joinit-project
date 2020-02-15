class FixColumnNameJustJoinitRawOffers < ActiveRecord::Migration[6.0]
  def change
    rename_column :just_join_it_raw_offers, :just_join_it_raw_data, :just_join_it_raw_data_id
  end
end
