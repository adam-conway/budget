class RemoveColumnsFromCharges < ActiveRecord::Migration[5.1]
  def change
    remove_column :charges, :outflow, :float
    remove_column :charges, :inflow, :float
  end
end
