class Client < ApplicationRecord
  has_many :schedules
  has_many :users, through: :schedules

  serialize :insurance, Array, coder: JSON

  validates :name, :address, :insurance, presence: true
end
