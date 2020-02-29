class RemoveColumnsFromJustJoinItParsedOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :just_join_it_parsed_offers, :title
    remove_column :just_join_it_parsed_offers, :city
    remove_column :just_join_it_parsed_offers, :company_name
    remove_column :just_join_it_parsed_offers, :company_url
    remove_column :just_join_it_parsed_offers, :salary_from
    remove_column :just_join_it_parsed_offers, :salary_to
    remove_column :just_join_it_parsed_offers, :skills
    remove_column :just_join_it_parsed_offers, :offer_url
    remove_column :just_join_it_parsed_offers, :marker_icon
  end
end
