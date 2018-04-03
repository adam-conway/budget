require 'rails_helper'

describe "User edits an existing charge" do
  scenario "a user edits already created charge" do
    budget = Budget.create!(name: "Denver")
    charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
    charge2 = budget.charges.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", outflow: 60)
    charge3 = budget.charges.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", outflow: 70)
    charge4 = budget.charges.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", inflow: 100)

    visit edit_budget_charge_path(budget, charge2)

    fill_in "charge[date]", with: "1991-08-28"
    fill_in "charge[payee]", with: "Jake"
    fill_in "charge[notes]", with: "Horrible purchase"
    fill_in "charge[outflow]", with: 20
    click_button "Update Charge"

    expect(current_path).to eq(budget_charges_path(budget))
    expect(page).to have_content("1991-08-28")
    expect(page).to_not have_content('2018-04-02')
  end
end
