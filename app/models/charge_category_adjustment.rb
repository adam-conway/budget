class ChargeCategoryAdjustment < ApplicationRecord
  belongs_to :category
  belongs_to :charge
  belongs_to :adjustment
end
