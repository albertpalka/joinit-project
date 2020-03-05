class RenameIdColumnsInTables < ActiveRecord::Migration[6.0]
  def change
    rename_column :just_join_it_raw_offers, :just_join_it_raw_datum_id, :raw_datum_id
    rename_column :just_join_it_parsed_offers, :just_join_it_raw_offer_id, :raw_offer_id
  end
end
