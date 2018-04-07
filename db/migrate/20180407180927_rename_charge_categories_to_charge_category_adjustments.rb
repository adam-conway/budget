class RenameChargeCategoriesToChargeCategoryAdjustments < ActiveRecord::Migration[5.1]
  def change
    rename_table :charge_categories, :charge_category_adjustments
  end
end
