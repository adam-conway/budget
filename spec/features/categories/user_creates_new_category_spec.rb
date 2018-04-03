require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    budget = Budget.create!(name: "Denver")
    visit new_budget_category_path(budget)

    fill_in "category[title]", with: "Rent"
    click_button "Create Category"

    expect(current_path).to eq(budget_path(budget))
    expect(page).to have_content("Rent")
    expect(Category.count).to eq(1)
  end
end
