class AddNullConstraintsToTables < ActiveRecord::Migration[6.0]
  def change
    change_column_null :just_join_it_parsed_offers, :title, false
    change_column_null :just_join_it_parsed_offers, :city, false
    change_column_null :just_join_it_parsed_offers, :company_name, false
    change_column_null :just_join_it_parsed_offers, :salary_from, false
    change_column_null :just_join_it_parsed_offers, :salary_to, false
    change_column_null :just_join_it_parsed_offers, :skills, false
    change_column_null :just_join_it_parsed_offers, :offer_url, false

    add_foreign_key :just_join_it_parsed_offers, :just_join_it_raw_offers
    add_foreign_key :just_join_it_raw_offers, :just_join_it_raw_data
  end
end
# add_foreign_key :posts, :users
