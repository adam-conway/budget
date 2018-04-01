require 'rails_helper'

describe "User creates a new transaction" do
  scenario "a user can create a new transaction" do
    visit transactions_path

    fill_in "transaction[date]", with: "1991-08-28"
    fill_in "transaction[payee]", with: "Jake"
    fill_in "transaction[notes]", with: "Horrible purchase"
    fill_in "transaction[outflow]", with: 20
    click_button "Create"

    expect(current_path).to eq(transactions_path)
    expect(page).to have_content("Jake")
    expect(Transaction.count).to eq(1)
  end
end
