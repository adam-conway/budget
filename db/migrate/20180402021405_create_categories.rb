class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title
      t.float :current_balance

      t.timestamps
    end
  end
end
