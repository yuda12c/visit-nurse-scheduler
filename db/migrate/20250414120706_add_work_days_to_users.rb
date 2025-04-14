class AddWorkDaysToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :workdays, :string
  end
end
