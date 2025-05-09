class Client < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :users, through: :schedules

  serialize :insurance, type: Array, coder: JSON

  validates :name, :address, presence: true
  validate :insurance_presence  

  private

  def insurance_presence
    if insurance.blank? || insurance.reject(&:blank?).empty?
      errors.add(:insurance, "を選択してください")
    end
  end
end
