require 'rails_helper'

describe "User sees all budgets" do
  scenario "a user sees all the budgets" do
    budget1 = Budget.create!(name: "Denver")
    budget2 = Budget.create!(name: "SF")

    visit budgets_path

    expect(page).to have_content(budget1.name)
    expect(page).to have_content(budget2.name)
  end
end
