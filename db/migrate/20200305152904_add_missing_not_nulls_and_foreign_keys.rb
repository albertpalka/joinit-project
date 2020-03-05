class AddMissingNotNullsAndForeignKeys < ActiveRecord::Migration[6.0]
  def change
    change_column_null :offers, :company, false
    change_column_null :offers, :title, false
    change_column_null :offers, :link, false
    change_column_null :offers, :city, false
    change_column_null :offers, :salary, false
    change_column_null :offers, :job_board, false
  end
end
