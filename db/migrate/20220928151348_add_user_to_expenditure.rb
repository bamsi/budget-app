class AddUserToExpenditure < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenditures, :author, references: :users, index: true
    add_foreign_key :expenditures, :users, column: :author_id
  end
end
