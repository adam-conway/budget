require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    user = User.create!(username: "user", password: "password")
    budget = user.budgets.create!(name: "Denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_user_budget_category_path(user, budget)

    fill_in "category[title]", with: "Rent"
    click_button "Create Category"

    expect(current_path).to eq(user_budget_path(user, budget))
    expect(page).to have_content("Rent")
    expect(Category.count).to eq(1)
  end
end
