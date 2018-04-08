class Budget < ApplicationRecord
  validates :name, presence: true

  has_many :categories, dependent: :destroy
  has_many :charges, dependent: :destroy
  belongs_to :user

  after_create :add_to_be_budgeted

  def available_to_budget
    categories.find_by(title: "To be budgeted").balance
  end

  private

  def add_to_be_budgeted
    categories.create(title: "To be budgeted")
  end
end
