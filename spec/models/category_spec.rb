require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.new(name: "Denver")
        category = Category.new()
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.create!(name: "Denver")
        category = budget.categories.new(title: "Rent")
        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many charges" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      category = budget.categories.create!(title: "Rent", budget_id: budget.id)
      charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
      charge2 = budget.charges.create!(date: '2018-04-01', payee: "Help", notes: "This was a great purchase", amount: 50)
      charge3 = budget.charges.create!(date: '2018-04-01', payee: "Jimmy", notes: "This was a great purchase", amount: 50)

      expect(category).to respond_to(:charges)
    end
  end

  describe "activerecord" do
    it "sums up all inflow totals associated with category" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      category = budget.categories.create!(title: "Rent")
      charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
      charge2 = budget.charges.create!(date: '2018-04-01', payee: "Help", notes: "This was a great purchase", amount: 50)
      charge3 = budget.charges.create!(date: '2018-04-01', payee: "Jimmy", notes: "This was a great purchase", amount: 50)
      adjustment1 = Adjustment.create!(amount: 50)
      adjustment2 = Adjustment.create!(amount: 50)
      adjustment3 = Adjustment.create!(amount: 50)
      adjustment4 = Adjustment.create!(amount: -50)
      ChargeCategoryAdjustment.create!(charge_id: charge1.id, category_id: category.id, adjustment_id: adjustment1.id)
      ChargeCategoryAdjustment.create!(charge_id: charge2.id, category_id: category.id, adjustment_id: adjustment2.id)
      ChargeCategoryAdjustment.create!(charge_id: charge3.id, category_id: category.id, adjustment_id: adjustment3.id)
      ChargeCategoryAdjustment.create!(charge_id: charge3.id, category_id: category.id, adjustment_id: adjustment4.id)

      expect(category.balance).to eq(100)
    end
  end
end
