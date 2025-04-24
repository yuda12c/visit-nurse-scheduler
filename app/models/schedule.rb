class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :sub_user, class_name: "User", optional: true
  belongs_to :client

  validates :user_id, presence: true 
  validates :client_id, presence: true
  validates :weekday, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
