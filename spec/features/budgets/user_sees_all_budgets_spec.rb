require 'rails_helper'

describe "User sees all budgets" do
  scenario "a user sees all the budgets" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budgets_path(user)

    expect(page).to have_content(budget1.name)
    expect(page).to have_content(budget2.name)
  end
  scenario "a user navigates to a budget from index" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budgets_path(user)

    click_on "Go to Denver budget"

    expect(current_path).to eq(user_budget_path(user, budget1))
  end
  scenario "a user navigates to create new budget from index" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budgets_path(user)

    click_on "Create a new budget"

    expect(current_path).to eq(new_user_budget_path(user))
  end
end
