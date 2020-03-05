class DropRawOffersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :just_join_it_raw_offers
  end
end
