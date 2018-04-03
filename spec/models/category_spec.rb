require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new(current_balance: 0)
        expect(category).to be_invalid
      end

      it "is invalid without a current balance" do
        category = Category.new(title: "Food")
        expect(category).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = Category.new(title: "Rent", current_balance: 0)
        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many charges" do
      category = Category.create!(title: "Rent", current_balance: 0)
      charge1 = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
      charge2 = Charge.create!(date: '2018-04-01', payee: "Help", notes: "This was a great purchase", outflow: 50)
      charge3 = Charge.create!(date: '2018-04-01', payee: "Jimmy", notes: "This was a great purchase", outflow: 50)
      ChargeCategory.create!(charge_id: charge1.id, category_id: category.id)
      ChargeCategory.create!(charge_id: charge2.id, category_id: category.id)
      ChargeCategory.create!(charge_id: charge3.id, category_id: category.id)

      expect(category).to respond_to(:charges)
    end
  end
end
