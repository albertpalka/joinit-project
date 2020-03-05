class CreateJustJoinItParsedOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :just_join_it_parsed_offers do |t|
      t.string :title
      t.string :city
      t.string :company_name
      t.string :company_url
      t.integer :salary_from
      t.integer :salary_to
      t.string :skills

      t.timestamps
    end
  end
end
