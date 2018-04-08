require 'rails_helper'

describe "User edits an existing charge" do
  scenario "a user edits already created charge" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
    charge2 = budget.charges.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", amount: 60)
    charge3 = budget.charges.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", amount: 70)
    charge4 = budget.charges.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", amount: 100)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_budget_charge_path(user, budget, charge2)

    fill_in "charge[date]", with: "1991-08-28"
    fill_in "charge[payee]", with: "Jake"
    fill_in "charge[notes]", with: "Horrible purchase"
    fill_in "charge[amount]", with: 20
    click_button "Update Charge"

    expect(current_path).to eq(user_budget_charges_path(user, budget))
    expect(page).to have_content("1991-08-28")
    expect(page).to_not have_content('2018-04-02')
  end
end
