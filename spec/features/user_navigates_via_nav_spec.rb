require 'rails_helper'

describe 'Navigation' do
  scenario 'allows a user to use home button' do
    visit '/'

    click_on 'Home'

    expect(current_path).to eq(root_path)
  end
  scenario 'allows a user to go to all my budgets page' do
    user = User.create(username: "username",
                       password: "password",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/'
    click_on 'My Budgets'
    click_on 'All My Budgets'

    expect(current_path).to eq(user_budgets_path(user))
  end
  scenario 'allows a user to go to specific budget from nav' do
    user = User.create(username: "username",
                       password: "password",
                       role: 0)
    budget = user.budgets.create!(name: "Denver")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/'
    click_on 'My Budgets'
    click_on 'Denver'

    expect(current_path).to eq(user_budget_path(user, budget))
  end
end
