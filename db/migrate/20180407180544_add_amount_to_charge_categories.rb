class AddAmountToChargeCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :charge_categories, :amount, :float
  end
end
