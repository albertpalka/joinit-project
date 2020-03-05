class AddMarkerColumnToParsedOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :just_join_it_parsed_offers, :marker_icon, :string
    change_column_null :just_join_it_parsed_offers, :marker_icon, false
  end
end
