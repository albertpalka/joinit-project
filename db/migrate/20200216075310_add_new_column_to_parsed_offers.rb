class AddNewColumnToParsedOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :just_join_it_parsed_offers, :offer_url, :string
  end
end
