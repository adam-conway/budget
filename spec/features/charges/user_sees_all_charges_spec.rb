require 'rails_helper'

describe "User sees all charges" do
  scenario "a user sees all the charges" do
    user = User.create!(username: "Adam", password: "password")
    budget = user.budgets.create!(name: "Denver")
    charge1 = budget.charges.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", amount: 50)
    charge2 = budget.charges.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", amount: 60)
    charge3 = budget.charges.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", amount: 70)
    charge4 = budget.charges.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", amount: 100)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_budget_charges_path(user, budget)

    expect(page).to have_content(charge1.amount)
    expect(page).to have_content(charge2.payee)
    expect(page).to have_content(charge3.notes)
    expect(page).to have_content(charge4.amount)
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
