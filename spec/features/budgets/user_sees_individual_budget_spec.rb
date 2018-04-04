require 'rails_helper'

describe "User sees one budget" do
  scenario "a user sees a budget" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")

    visit user_budget_path(user, budget)

    expect(current_path).to eq(user_budget_path(user, budget))
    expect(page).to have_content("Denver")
  end
  scenario "a user sees a budgets categories" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    category1 = budget.categories.create!(title: 'Food', current_balance: 0)
    category2 = budget.categories.create!(title: 'Rent', current_balance: 0)
    category3 = budget.categories.create!(title: 'Test', current_balance: 0)

    visit user_budget_path(user, budget)

    expect(page).to have_content("Food")
    expect(page).to have_content("Rent")
    expect(page).to have_content("Test")
  end
end
