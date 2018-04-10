require 'rails_helper'

describe "User sees one budget" do
  describe "a user sees a budgets categories" do
    scenario "adds funds to a category" do
      user = User.create!(username: "Adam", password: "password")
      budget = user.budgets.create!(name: "Denver")
      charge = budget.charges.create!(date: '2018-04-01', payee: "Adam", amount: 100)
      adjustment = Adjustment.create!(amount: charge.amount)
      ChargeCategoryAdjustment.create!(charge_id: charge.id, category_id: budget.categories.first.id, adjustment_id: adjustment.id)
      category1 = budget.categories.create!(title: 'Food')
      category2 = budget.categories.create!(title: 'Rent')
      category3 = budget.categories.create!(title: 'Test')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_budget_path(user, budget)
      save_and_open_page

      within(category2.title.to_s) do
        fill_in 'adjustment[amount]', with: 50
        click('Add Funds')
      end

      expect(current_path).to eq(user_budget_path(user, budget))
      within('.card-nth-of-type(1)') do
        expect(page).to have_content('$50.00 Available')
      end
      within('.card-nth-of-type(3)') do
        expect(page).to have_content('$50.00 Available')
      end
    end
  end
end
