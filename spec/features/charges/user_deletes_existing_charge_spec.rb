require 'rails_helper'

describe "User sees all charges" do
  scenario "a user sees all the charges" do
    charge1 = Charge.create!(date: '2018-04-01', payee: "Adam", notes: "This was a great purchase", outflow: 50)
    charge2 = Charge.create!(date: '2018-04-02', payee: "Mariah", notes: "This was a bad purchase", outflow: 60)
    charge3 = Charge.create!(date: '2018-04-03', payee: "Evan", notes: "This was a ok purchase", outflow: 70)
    charge4 = Charge.create!(date: '2018-04-03', payee: "BBC", notes: "This was an ok check", inflow: 100)

    visit charges_path

    within('tr:nth-child(4)') do
      click_link "Delete"
    end

    expect(current_path).to eq(charges_path)
    expect(page).to have_content("Charge from 2018-04-02 successfully deleted!")
    expect(page).to_not have_content(charge2.payee)
  end
end
