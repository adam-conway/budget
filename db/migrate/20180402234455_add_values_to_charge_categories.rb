class AddValuesToChargeCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :charge_categories, :inflow, :float
    add_column :charge_categories, :outflow, :float
  end
end
