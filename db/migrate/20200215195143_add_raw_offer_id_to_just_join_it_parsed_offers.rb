class AddRawOfferIdToJustJoinItParsedOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :just_join_it_parsed_offers, :just_join_it_raw_offers_id, :integer
  end
end
