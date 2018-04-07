class CreateAdjustments < ActiveRecord::Migration[5.1]
  def change
    create_table :adjustments do |t|
      t.float :amount

      t.timestamps
    end
  end
end
