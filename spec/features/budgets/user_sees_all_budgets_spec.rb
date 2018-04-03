require 'rails_helper'

describe "User sees all budgets" do
  scenario "a user sees all the budgets" do
    budget = Budget.create!(title: 'Rent', current_balance: 0)

    visit budgets_path

    expect(page).to have_content(budget.name)
  end
end
