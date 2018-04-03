require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        budget = Budget.create!(name: "Denver")
        category = Category.new(current_balance: 0, budget_id: budget.id)
        expect(category).to be_invalid
      end

      it "is invalid without a current balance" do
        budget = Budget.create!(name: "Denver")
        category = Category.new(title: "Food", budget_id: budget.id)
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        budget = Budget.create!(name: "Denver")
        category = Category.new(title: "Rent", current_balance: 0, budget_id: budget.id)
        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many charges" do
      budget = Budget.create!(name: "Denver")
      category = Category.create!(title: "Rent", current_balance: 0, budget_id: budget.id)
      charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
      charge2 = budget.charges.create!(date: '2018-04-01', payee: "Help", notes: "This was a great purchase", outflow: 50)
      charge3 = budget.charges.create!(date: '2018-04-01', payee: "Jimmy", notes: "This was a great purchase", outflow: 50)
      ChargeCategory.create!(charge_id: charge1.id, category_id: category.id)
      ChargeCategory.create!(charge_id: charge2.id, category_id: category.id)
      ChargeCategory.create!(charge_id: charge3.id, category_id: category.id)

      expect(category).to respond_to(:charges)
    end
  end
end
