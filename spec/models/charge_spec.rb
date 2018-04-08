require 'rails_helper'

describe Charge do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a date" do
        charge1 = Charge.new(payee: "Adam", notes: "This was a great purchase", amount: 50)
        expect(charge1).to be_invalid
      end

      it "is invalid without a payee" do
        charge1 = Charge.new(date: '2018-04-01', notes: "This was a great purchase", amount: 50)
        expect(charge1).to be_invalid
      end

      it "is invalid without an amount" do
        charge1 = Charge.new(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase")
        expect(charge1).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.create!(name: "Denver")
        charge1 = budget.charges.new(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
        expect(charge1).to be_valid
      end
      it "Can be created with just a date, payee, and amount" do
        user = User.create!(username: "Adam", password: "password")
        budget = user.budgets.create!(name: "Denver")
        charge1 = budget.charges.new(date: '2018-04-01', payee: "Adam", amount: 10)
        expect(charge1).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has a category" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      charge = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
      category = budget.categories.create!(title: "Rent")
      adjustment = Adjustment.create!(amount: charge.amount)
      ChargeCategoryAdjustment.create!(charge_id: charge.id, category_id: category.id, adjustment_id: adjustment.id)

      expect(charge).to respond_to(:categories)
      expect(charge.categories.count).to eq(1)
    end
    it "has a budget" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      charge = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
      category = budget.categories.create!(title: "Rent")

      expect(charge).to respond_to(:budget)
    end
    it "can have multiple categories" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      charge = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50, budget_id: budget.id)
      category1 = budget.categories.create!(title: "Rent")
      category2 = budget.categories.create!(title: "Food")
      category3 = budget.categories.create!(title: "Car")
      adjustment1 = Adjustment.create!(amount: 10)
      adjustment2 = Adjustment.create!(amount: 11)
      adjustment3 = Adjustment.create!(amount: 12)
      ChargeCategoryAdjustment.create!(charge_id: charge.id, category_id: category1.id, adjustment_id: adjustment1.id)
      ChargeCategoryAdjustment.create!(charge_id: charge.id, category_id: category2.id, adjustment_id: adjustment2.id)
      ChargeCategoryAdjustment.create!(charge_id: charge.id, category_id: category3.id, adjustment_id: adjustment3.id)

      expect(charge).to respond_to(:categories)
      expect(charge.categories.count).to eq(3)
    end
  end
end
