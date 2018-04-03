class AddBudgetToCharges < ActiveRecord::Migration[5.1]
  def change
    add_reference :charges, :budget, foreign_key: true
  end
end
