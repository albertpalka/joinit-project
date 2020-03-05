class AddStaleColumnToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :stale, :boolean, default: false, null: false
  end
end
