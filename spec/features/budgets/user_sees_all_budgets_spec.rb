require 'rails_helper'

describe "User sees all budgets" do
  scenario "a user sees all the budgets" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")

    visit user_budgets_path(user)

    expect(page).to have_content(budget1.name)
    expect(page).to have_content(budget2.name)
  end
end
