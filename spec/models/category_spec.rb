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

  # describe "relationships" do
  #   it "has a category" do
  #     transaction = Transaction.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
  #     category = Category.create!(name: "Adam", role: "CEO", email: "adam.n.conway@gmail.com")
  #     expect(contact).to respond_to(:company)
  #   end
  #   it "can have multiple categories" do
  #     company = Company.create!(name: "Turing")
  #     contact = company.contacts.create!(name: "Adam", role: "CEO", email: "adam.n.conway@gmail.com")
  #     expect(contact).to respond_to(:company)
  #   end
  # end
end
