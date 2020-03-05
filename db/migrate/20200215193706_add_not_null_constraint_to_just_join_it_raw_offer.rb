class AddNotNullConstraintToJustJoinItRawOffer < ActiveRecord::Migration[6.0]
  def change
    change_column_null :just_join_it_raw_offers, :body, false
  end
end
