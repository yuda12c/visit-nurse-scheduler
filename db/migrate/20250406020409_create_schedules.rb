class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :user,   null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string     :weekday, null:false
      t.string     :timeslot, null: false
      t.string     :duration, null: false
      t.string     :memo
      t.timestamps
    end
  end
end
