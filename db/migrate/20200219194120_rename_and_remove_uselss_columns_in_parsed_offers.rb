class RenameAndRemoveUselssColumnsInParsedOffers < ActiveRecord::Migration[6.0]
  def change
    rename_column :just_join_it_parsed_offers, :just_join_it_raw_datum_id, :raw_datum_id
    remove_column :just_join_it_parsed_offers, :raw_offer_id, :integer
  end
end
