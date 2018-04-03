class Charge < ApplicationRecord
  validates :date, :payee, presence: true

  has_many :charge_categories, dependent: :destroy
  has_many :categories, through: :charge_categories
  belongs_to :budget

  def self.order_by_date
    order(date: :desc)
  end
end
