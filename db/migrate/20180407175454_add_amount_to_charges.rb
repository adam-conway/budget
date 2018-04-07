class AddAmountToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :amount, :float
  end
end
