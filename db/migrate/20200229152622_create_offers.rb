class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :company
      t.string :title
      t.string :link
      t.string :city
      t.string :salary
      t.string :job_board

      t.timestamps
    end
  end
end
