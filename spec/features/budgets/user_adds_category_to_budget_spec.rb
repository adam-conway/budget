require 'rails_helper'

describe "User sees one budget" do
  scenario "adds a category to a budget" do
    budget = Budget.create!(name: "Denver")

    visit budget_path(budget)
    click_on("Create a new category")

    fill_in "category[title]", with: "Rent"
    click_button "Create Category"

    expect(current_path).to eq(budget_path(budget))
    expect(page).to have_content("Rent")
    expect(Category.count).to eq(1)
  end
  # scenario "a user sees a budgets categories" do
  #   budget = Budget.create!(name: "Denver")
  #   category1 = budget.categories.create!(title: 'Food', current_balance: 0)
  #   category2 = budget.categories.create!(title: 'Rent', current_balance: 0)
  #   category3 = budget.categories.create!(title: 'Test', current_balance: 0)
  #
  #   visit budget_path(budget)
  #
  #   expect(page).to have_content("Food")
  #   expect(page).to have_content("Rent")
  #   expect(page).to have_content("Test")
  # end
end
