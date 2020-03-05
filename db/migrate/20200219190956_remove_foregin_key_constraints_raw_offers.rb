class RemoveForeginKeyConstraintsRawOffers < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :just_join_it_parsed_offers, :just_join_it_raw_offers
    remove_foreign_key :just_join_it_raw_offers, :just_join_it_raw_data
  end
end
