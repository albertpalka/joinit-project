class AddNewForeignKeyToParsedOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :just_join_it_parsed_offers, :just_join_it_raw_datum_id, :integer
    add_foreign_key :just_join_it_parsed_offers, :just_join_it_raw_data
  end
end
