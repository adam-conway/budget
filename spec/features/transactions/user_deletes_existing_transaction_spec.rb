require 'rails_helper'

describe "User sees all transactions" do
  scenario "a user sees all the companies" do
    transaction1 = Transaction.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
    transaction2 = Transaction.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", outflow: 60)
    transaction3 = Transaction.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", outflow: 70)
    transaction4 = Transaction.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", inflow: 100)

    visit transactions_path

    within('tr:nth-child(2)') do
      click_link "Delete"
    end

    expect(current_path).to eq(transactions_path)
    expect(page).to have_content("Transaction from 2018-04-02 successfully deleted!")
    expect(page).to_not have_content(transaction2.payee)
  end
end
