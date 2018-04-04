require 'rails_helper'

describe "User creates a budget" do
  scenario "a user creates a new budget" do
    user = User.create!(username: "Adam", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit user_budgets_path(user)
    click_on("Create a new budget")

    expect(current_path).to eq(new_user_budget_path(user))

    fill_in "budget[name]", with: 'Testing'
    click_on("Create Budget")

    expect(current_path).to eq(user_budgets_path(user))
    expect(page).to have_content('Testing')
  end
end
