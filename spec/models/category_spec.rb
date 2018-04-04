require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.new(name: "Denver")
        category = Category.new(current_balance: 0, budget_id: budget.id)
        expect(category).to be_invalid
      end

      it "is invalid without a current balance" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.new(name: "Denver")
        category = Category.new(title: "Food", budget_id: budget.id)
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.create!(name: "Denver")
        category = budget.categories.new(title: "Rent", current_balance: 0, budget_id: budget.id)
        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many charges" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
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

  describe "activerecord" do
    it "sums up all outflow totals associated with category" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      category = budget.categories.create!(title: "Rent", current_balance: 0)
      charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
      charge2 = budget.charges.create!(date: '2018-04-01', payee: "Help", notes: "This was a great purchase", outflow: 50)
      charge3 = budget.charges.create!(date: '2018-04-01', payee: "Jimmy", notes: "This was a great purchase", outflow: 50)
      ChargeCategory.create!(charge_id: charge1.id, category_id: category.id, outflow: 50)
      ChargeCategory.create!(charge_id: charge2.id, category_id: category.id, outflow: 50)
      ChargeCategory.create!(charge_id: charge3.id, category_id: category.id, outflow: 50)

      expect(category.total_outflows).to eq(150)
    end
    it "sums up all inflow totals associated with category" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      category = budget.categories.create!(title: "Rent", current_balance: 0)
      charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", inflow: 50)
      charge2 = budget.charges.create!(date: '2018-04-01', payee: "Help", notes: "This was a great purchase", inflow: 50)
      charge3 = budget.charges.create!(date: '2018-04-01', payee: "Jimmy", notes: "This was a great purchase", inflow: 50)
      ChargeCategory.create!(charge_id: charge1.id, category_id: category.id, inflow: 50)
      ChargeCategory.create!(charge_id: charge2.id, category_id: category.id, inflow: 50)
      ChargeCategory.create!(charge_id: charge3.id, category_id: category.id, inflow: 50)

      expect(category.total_inflows).to eq(150)
    end
  end
end
