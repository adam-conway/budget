require 'rails_helper'

describe "User sees all charges" do
  scenario "a user sees all the charges" do
    charge1 = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
    charge2 = Charge.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", outflow: 60)
    charge3 = Charge.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", outflow: 70)
    charge4 = Charge.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", inflow: 100)

    visit charges_path

    expect(page).to have_content(charge1.outflow)
    expect(page).to have_content(charge2.payee)
    expect(page).to have_content(charge3.notes)
    expect(page).to have_content(charge4.inflow)
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
