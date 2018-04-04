require 'rails_helper'

describe "User edits an existing budget" do
  scenario "a user edits already created budget" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_budget_path(user, budget)

    click_on("Edit Budget")
    fill_in "budget[name]", with: "Oakland"
    click_button "Update Budget"

    expect(current_path).to eq(user_budgets_path(user))
    expect(page).to have_content("Oakland")
  end
end
