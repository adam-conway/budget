class Category < ApplicationRecord
  validates :title, :current_balance, presence: true

end
