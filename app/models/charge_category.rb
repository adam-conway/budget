class ChargeCategory < ApplicationRecord
  belongs_to :category
  belongs_to :charge
end
