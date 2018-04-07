class RemoveColumnsFromChargeCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :charge_categories, :outflow, :float
    remove_column :charge_categories, :inflow, :float
  end
end
