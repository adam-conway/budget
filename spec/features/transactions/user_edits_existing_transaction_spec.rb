require 'rails_helper'

describe "User edits an existing transaction" do
  scenario "a user edits already created transaction" do
    transaction1 = Transaction.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
    transaction2 = Transaction.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", outflow: 60)
    transaction3 = Transaction.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", outflow: 70)
    transaction4 = Transaction.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", inflow: 100)

    visit edit_transaction_path(transaction2)

    fill_in "transaction[date]", with: "1991-08-28"
    fill_in "transaction[payee]", with: "Jake"
    fill_in "transaction[notes]", with: "Horrible purchase"
    fill_in "transaction[outflow]", with: 20
    click_button "Update Transaction"

    expect(current_path).to eq(transactions_path)
    expect(page).to have_content("1991-08-28")
    expect(page).to_not have_content('2018-04-02')
  end
end
