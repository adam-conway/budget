class Charge < ApplicationRecord
  validates :date, :payee, presence: true

  has_many :charge_category_adjustments, dependent: :destroy
  has_many :categories, through: :charge_category_adjustments
  has_many :adjustments, through: :charge_category_adjustments
  belongs_to :budget

  def self.order_by_date
    order(date: :desc)
  end
end
