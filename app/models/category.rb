class Category < ApplicationRecord
  validates :title, presence: true

  has_many :charge_category_adjustments, dependent: :destroy
  has_many :charges, through: :charge_category_adjustments
  has_many :adjustments, through: :charge_category_adjustments
  belongs_to :budget

  def balance
    self.adjustments.sum(:amount)
  end
end
