class RemoveAmountFromChargeCategoryAdjustments < ActiveRecord::Migration[5.1]
  def change
    remove_column :charge_category_adjustments, :amount, :float
  end
end
