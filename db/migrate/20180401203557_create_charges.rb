class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.date :date
      t.string :payee
      t.string :notes
      t.float :outflow
      t.float :inflow

      t.timestamps
    end
  end
end
