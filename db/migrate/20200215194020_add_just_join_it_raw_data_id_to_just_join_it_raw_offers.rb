class AddJustJoinItRawDataIdToJustJoinItRawOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :just_join_it_raw_offers, :just_join_it_raw_data, :integer
  end
end
