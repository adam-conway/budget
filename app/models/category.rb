class Category < ApplicationRecord
  validates :title, :current_balance, presence: true

  has_many :charge_categories
  has_many :charges, through: :charge_categories
  belongs_to :budget
end
