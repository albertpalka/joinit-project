class AddColumnToJustJoinItParsedOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :just_join_it_parsed_offers, :body, :jsonb
  end
end
