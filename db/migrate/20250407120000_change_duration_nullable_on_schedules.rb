class ChangeDurationNullableOnSchedules < ActiveRecord::Migration[7.1]
  def change
    def change
      change_column_null :schedules, :duration, true
    end
  end
end
