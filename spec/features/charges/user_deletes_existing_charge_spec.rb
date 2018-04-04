require 'rails_helper'

describe "User sees all charges" do
  scenario "a user sees all the charges" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
    charge2 = budget.charges.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", outflow: 60)
    charge3 = budget.charges.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", outflow: 70)
    charge4 = budget.charges.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", inflow: 100)

    visit user_budget_charges_path(user, budget)

    within('tr:nth-child(4)') do
      click_link "Delete"
    end

    expect(current_path).to eq(user_budget_charges_path(user, budget))
    expect(page).to have_content("Charge from 2018-04-02 successfully deleted!")
    expect(page).to_not have_content(charge2.payee)
  end
end
