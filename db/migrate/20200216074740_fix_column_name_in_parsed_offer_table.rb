class FixColumnNameInParsedOfferTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :just_join_it_parsed_offers, :just_join_it_raw_offers_id, :just_join_it_raw_offer_id
  end
end
