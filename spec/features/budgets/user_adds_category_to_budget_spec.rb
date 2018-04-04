require 'rails_helper'

describe "User sees one budget" do
  scenario "adds a category to a budget" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget)
    click_on("Create a new category")

    fill_in "category[title]", with: "Rent"
    click_button "Create Category"

    expect(current_path).to eq(user_budget_path(user, budget))
    expect(page).to have_content("Rent")
    expect(Category.count).to eq(1)
  end
end
