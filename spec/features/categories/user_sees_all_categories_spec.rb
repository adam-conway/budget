require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    category1 = budget.categories.create!(title: 'Rent', current_balance: 0)
    category2 = budget.categories.create!(title: 'Food', current_balance: 0)
    category3 = budget.categories.create!(title: 'Car payment', current_balance: 0)
    category4 = budget.categories.create!(title: 'Car insurance', current_balance: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_path(user, budget)

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.current_balance)
    expect(page).to have_content(category3.current_balance)
    expect(page).to have_content(category4.title)
  end
end
