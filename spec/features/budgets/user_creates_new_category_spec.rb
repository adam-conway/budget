require 'rails_helper'

describe "User creates a budget" do
  scenario "a user creates a new budget" do
    visit budgets_path
    click_on("Create a new budget")

    expect(current_path).to eq(new_budget_path)

    fill_in "budget[name]", with: 'Testing'
    click_on("Create Budget")

    expect(current_path).to eq(budgets_path)
    expect(page).to have_content('Testing')
  end
end
