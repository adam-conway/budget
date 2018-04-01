class Transaction < ApplicationRecord
  validates :date, :payee, presence: true

end
