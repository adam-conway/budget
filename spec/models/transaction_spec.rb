require 'rails_helper'

describe Transaction do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a date" do
        transaction1 = Transaction.new(payee: "Adam", notes: "This was a great purchase", outflow: 50)
        expect(transaction1).to be_invalid
      end

      it "is invalid without a payee" do
        transaction1 = Transaction.new(date: '2018-04-01', notes: "This was a great purchase", outflow: 50)
        expect(transaction1).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        transaction1 = Transaction.new(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
        expect(transaction1).to be_valid
      end
      it "Can be created with just a date and payee" do
        transaction1 = Transaction.new(date: '2018-04-01', payee: "Adam")
        expect(transaction1).to be_valid
      end
    end
  end

  # describe "relationships" do
  #   it "has many jobs" do
  #     company = Company.new(name: "Dropbox")
  #     expect(company).to respond_to(:jobs)
  #   end
  # end
end
