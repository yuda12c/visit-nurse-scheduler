class AddSubUserIdToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :sub_user_id, :integer
  end
end
