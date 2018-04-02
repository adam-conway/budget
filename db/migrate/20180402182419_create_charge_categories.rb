class CreateChargeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :charge_categories do |t|
      t.references :category, foreign_key: true
      t.references :charge, foreign_key: true

      t.timestamps
    end
  end
end
