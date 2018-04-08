require 'rails_helper'

describe "User sees one budget" do
  scenario "a user sees a budget" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget)

    expect(current_path).to eq(user_budget_path(user, budget))
    expect(page).to have_content("Denver")
  end
  scenario "a user sees a budgets categories" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    category1 = budget.categories.create!(title: 'Food')
    category2 = budget.categories.create!(title: 'Rent')
    category3 = budget.categories.create!(title: 'Test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget)

    expect(page).to have_content("Food")
    expect(page).to have_content("Rent")
    expect(page).to have_content("Test")
  end
  scenario "a user navigates to create new category from show page" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget1)

    click_on "Create a new category"

    expect(current_path).to eq(new_user_budget_category_path(user, budget1))
  end
  scenario "a user navigates to edit budget from show page" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget1)

    click_on "Edit Budget"

    expect(current_path).to eq(edit_user_budget_path(user, budget1))
  end
  scenario "a user navigates to all budget charges from show page" do
    user = User.create!(username: "Adam", password: "password")
    budget1 = user.budgets.create!(name: "Denver")
    budget2 = user.budgets.create!(name: "SF")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget1)

    click_on "Charges"

    expect(current_path).to eq(user_budget_charges_path(user, budget1))
  end
end
