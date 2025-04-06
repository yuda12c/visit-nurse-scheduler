class Client < ApplicationRecord
  has_many :schedules
  has_many :users, through: :schedules

  validates :name, :address, :insurance, presence: true
end
