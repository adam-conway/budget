class Charge < ApplicationRecord
  validates :date, :payee, presence: true

  has_many :charge_categories
  has_many :categories, through: :charge_categories

  def self.order_by_date
    order(date: :desc)
  end
end
