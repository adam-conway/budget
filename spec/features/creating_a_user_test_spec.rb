require 'rails_helper'

describe 'Authentication' do
  # scenario 'anonymous users should not see a log out page' do
  #   user = User.create(username: 'funbucket13', password: 'test')
  #
  #   visit '/'
  #   expect(page).to_not have_content('Log out')
  # end
  scenario 'allows a user to register successfully' do
    username = 'Student'
    visit '/'

    click_on 'Sign up to be a User'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[username]', with: username
    fill_in 'user[password]', with: 'supersecretpasswordyouwillneverguess'

    click_on 'Create User'

    expect(page).to have_content("Welcome, #{username}")
  end
  # scenario 'allows a user to log in' do
  #   user = User.create(username: 'funbucket13', password: 'test')
  #
  #   visit '/'
  #
  #   click_on 'I already have an account'
  #
  #   expect(current_path).to eq(login_path)
  #
  #   fill_in 'username', with: user.username
  #   fill_in 'password', with: user.password
  #
  #   click_on 'Log in'
  #
  #   expect(current_path).to eq(user_path(user))
  #
  #   expect(page).to have_content("Welcome, #{user.username}")
  #   visit '/'
  #   expect(page).to have_content('Log out')
  # end
  # scenario 'allows a user to log out' do
  #   user = User.create(username: 'funbucket13', password: 'test')
  #
  #   visit '/'
  #
  #   click_on 'I already have an account'
  #
  #   expect(current_path).to eq(login_path)
  #
  #   fill_in 'username', with: user.username
  #   fill_in 'password', with: user.password
  #
  #   click_on 'Log in'
  #
  #   visit '/'
  #   expect(page).to have_content('Log out')
  #   click_on 'Log out'
  #
  #   visit '/'
  #   expect(page).to_not have_content('Log out')
  # end
end
