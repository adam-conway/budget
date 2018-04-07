class RemoveCurrentBalanceFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :current_balance, :float
  end
end
