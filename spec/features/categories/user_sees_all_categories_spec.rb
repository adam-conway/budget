require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    budget = Budget.create!(name: "Denver")
    category1 = Category.create!(title: 'Rent', current_balance: 0, budget_id: budget.id)
    category2 = Category.create!(title: 'Food', current_balance: 0, budget_id: budget.id)
    category3 = Category.create!(title: 'Car payment', current_balance: 0, budget_id: budget.id)
    category4 = Category.create!(title: 'Car insurance', current_balance: 0, budget_id: budget.id)

    visit budget_path(budget)

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.current_balance)
    expect(page).to have_content(category3.current_balance)
    expect(page).to have_content(category4.title)
  end
end
