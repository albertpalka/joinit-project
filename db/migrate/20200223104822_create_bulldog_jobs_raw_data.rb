class CreateBulldogJobsRawData < ActiveRecord::Migration[6.0]
  def change
    create_table :bulldog_jobs_raw_data do |t|
      t.string :body

      t.timestamps
    end
  end
end
