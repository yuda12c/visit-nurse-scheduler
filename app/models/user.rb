class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, presence: true
       
    validates :email, presence: true,
                           format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "に@を含めてください" }
       
    validates :password, presence: true,
                              length: { minimum: 6 },
                              format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/, message: "は英字と数字を含めてください" }
       
    validates :workday, presence: true
    validates :worktime, presence: true
    validates :eligibility, presence: true

  has_many :schedules, dependent: :destroy
  has_many :clients, through: :schedules
end
