require 'rails_helper'

describe "User sees one budget" do
  scenario "a user sees a budgets categories" do
    scenario "adds funds to a category" do
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
  end
end
