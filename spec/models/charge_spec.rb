require 'rails_helper'

describe Charge do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a date" do
        charge1 = Charge.new(payee: "Adam", notes: "This was a great purchase", outflow: 50)
        expect(charge1).to be_invalid
      end

      it "is invalid without a payee" do
        charge1 = Charge.new(date: '2018-04-01', notes: "This was a great purchase", outflow: 50)
        expect(charge1).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        budget = Budget.create!(name: "Denver")
        charge1 = Charge.new(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50, budget_id: budget.id)
        expect(charge1).to be_valid
      end
      it "Can be created with just a date and payee" do
        budget = Budget.create!(name: "Denver")
        charge1 = Charge.new(date: '2018-04-01', payee: "Adam", budget_id: budget.id)
        expect(charge1).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has a category" do
      budget = Budget.create!(name: "Denver")
      charge = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50, budget_id: budget.id)
      category = Category.create!(title: "Rent", current_balance: 0, budget_id: budget.id)
      ChargeCategory.create!(charge_id: charge.id, category_id: category.id)

      expect(charge).to respond_to(:categories)
      expect(charge.categories.count).to eq(1)
    end
    it "has a budget" do
      budget = Budget.create!(name: "Denver")
      charge = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50, budget_id: budget.id)
      category = Category.create!(title: "Rent", current_balance: 0, budget_id: budget.id)

      expect(charge).to respond_to(:budget)
    end
    it "can have multiple categories" do
      budget = Budget.create!(name: "Denver")
      charge = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50, budget_id: budget.id)
      category1 = Category.create!(title: "Rent", current_balance: 0, budget_id: budget.id)
      category2 = Category.create!(title: "Food", current_balance: 0, budget_id: budget.id)
      category3 = Category.create!(title: "Car", current_balance: 0, budget_id: budget.id)
      ChargeCategory.create!(charge_id: charge.id, category_id: category1.id)
      ChargeCategory.create!(charge_id: charge.id, category_id: category2.id)
      ChargeCategory.create!(charge_id: charge.id, category_id: category3.id)

      expect(charge).to respond_to(:categories)
      expect(charge.categories.count).to eq(3)
    end
  end
end
