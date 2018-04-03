require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category1 = Category.create!(title: 'Rent', current_balance: 0)
    category2 = Category.create!(title: 'Food', current_balance: 0)
    category3 = Category.create!(title: 'Car payment', current_balance: 0)
    category4 = Category.create!(title: 'Car insurance', current_balance: 0)

    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.current_balance)
    expect(page).to have_content(category3.current_balance)
    expect(page).to have_content(category4.title)
  end
end
