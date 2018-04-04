class Category < ApplicationRecord
  validates :title, :current_balance, presence: true

  has_many :charge_categories, dependent: :destroy
  has_many :charges, through: :charge_categories
  belongs_to :budget

  def total_outflows
    self.charge_categories.sum(:outflow)
  end

  def total_inflows
    self.charge_categories.sum(:inflow)
  end
end
