require 'rails_helper'

describe "User sees one budget" do
  scenario "a user sees a budget" do
    budget = Budget.create!(name: "Denver")

    visit budget_path(budget)

    expect(current_path).to eq(budget_path(budget))
    expect(page).to have_content("Denver")
  end
  scenario "a user sees a budgets categories" do
    budget = Budget.create!(name: "Denver")
    category1 = budget.categories.create!(title: 'Food', current_balance: 0)
    category2 = budget.categories.create!(title: 'Rent', current_balance: 0)
    category3 = budget.categories.create!(title: 'Test', current_balance: 0)

    visit budget_path(budget)

    expect(page).to have_content("Food")
    expect(page).to have_content("Rent")
    expect(page).to have_content("Test")
  end
end
