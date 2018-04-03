require 'rails_helper'

describe "User sees all budgets" do
  scenario "a user sees all the budgets" do
    budget = Budget.create!(name: 'Adam')

    visit budgets_path

    expect(page).to have_content(budget.name)
  end
end
