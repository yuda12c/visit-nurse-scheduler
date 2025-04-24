class User < ApplicationRecord

    validates :name, presence: true       
    validates :email, presence: true, uniqueness: true
    validates :workdays, presence: true
    validates :worktime, presence: true
    validates :eligibility, presence: true

  has_many :schedules, dependent: :destroy
  has_many :clients, through: :schedules
end
