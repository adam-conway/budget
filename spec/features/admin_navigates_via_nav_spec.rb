require 'rails_helper'

describe 'Navigation' do
  scenario 'allows an admin to go to all budgets page' do
    admin = User.create(username: "username",
                       password: "password",
                       role: 1)
    budget = admin.budgets.create!(name: "Denver")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit '/'
    click_on 'All Budgets'

    expect(current_path).to eq(admin_budgets_path)
    expect(page).to have_content(budget.name)
  end
  scenario 'prevents a user from going to all budgets page' do
    user = User.create(username: "username", password: "password", role: 0)
    user2 = User.create(username: "Megan", password: "password", role: 0)

    budget = user2.budgets.create!(name: "Denver")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_budgets_path

    expect(current_path).to eq(admin_budgets_path)
    expect(page).to_not have_content(budget.name)
  end
  scenario 'allows an admin to go to all users page' do
    admin = User.create(username: "username",
                       password: "password",
                       role: 1)
    user1 = User.create(username: "Adam", password: "password", role: 0)
    user2 = User.create(username: "Megan", password: "password", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit '/'
    click_on 'All Users'

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
  end
  scenario 'prevents a user from going to all users page' do
    user = User.create(username: "username", password: "password", role: 0)
    user2 = User.create(username: "Megan", password: "password", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_users_path

    expect(current_path).to eq(admin_users_path)
    expect(page).to_not have_content(user2.username)
  end
end
