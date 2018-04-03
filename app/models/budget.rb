class Budget < ApplicationRecord
  validates :name, presence: true

  has_many :categories, dependent: :destroy
  has_many :charges, dependent: :destroy
end
