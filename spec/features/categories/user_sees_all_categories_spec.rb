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
  # describe "User clicks links" do
  #   scenario "User clicks company link" do
  #     company = Company.create!(name: "ESPN")
  #     company_two = Company.create!(name: "Disney")
  #     visit "/companies"
  #
  #     click_on("Disney")
  #
  #     expect(current_path).to eq(company_path(company_two))
  #   end
  #   scenario "User clicks company edit link" do
  #     company = Company.create!(name: "ESPN")
  #     visit "/companies"
  #
  #     click_on("Edit")
  #
  #
  #     expect(current_path).to eq(edit_company_path(company))
  #   end
  #   scenario "User clicks company edit link" do
  #     company = Company.create!(name: "ESPN")
  #     visit "/companies"
  #
  #     click_on("Delete")
  #
  #     expect(current_path).to eq(companies_path)
  #     expect(page).to have_content("ESPN was successfully deleted")
  #     expect(Company.all.count).to eq(0)
  #   end
  # end
end
