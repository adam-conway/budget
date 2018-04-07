class Adjustment < ApplicationRecord
  validates :amount, presence: true

  has_many :charge_category_adjustments
  has_many :charges, through: :charge_category_adjustments
  has_many :categories, through: :charge_category_adjustments
end
