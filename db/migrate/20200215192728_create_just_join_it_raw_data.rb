class CreateJustJoinItRawData < ActiveRecord::Migration[6.0]
  def change
    create_table :just_join_it_raw_data do |t|
      t.string :body

      t.timestamps
    end
  end
end
