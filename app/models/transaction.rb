class Transaction < ApplicationRecord
  validates :date, :payee, presence: true

  def self.order_by_date
    order(date: :desc)
  end
end
