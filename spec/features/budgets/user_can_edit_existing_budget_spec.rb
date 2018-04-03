require 'rails_helper'

describe "User edits an existing budget" do
  scenario "a user edits already created budget" do
    budget = Budget.create!(name: "Denver")
    visit edit_budget_path(budget)

    fill_in "budget[name]", with: "Oakland"
    click_button "Update Budget"

    expect(current_path).to eq(budgets_path)
    expect(page).to have_content("Oakland")
    expect(page).to_not have_content('Denver')
  end
end
