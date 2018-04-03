require 'rails_helper'

describe "User creates a new charge" do
  scenario "a user can create a new charge from index page" do
    visit charges_path

    fill_in "charge[date]", with: "1991-08-28"
    fill_in "charge[payee]", with: "Jake"
    fill_in "charge[notes]", with: "Horrible purchase"
    fill_in "charge[outflow]", with: 20
    click_button "Create"

    expect(current_path).to eq(charges_path)
    expect(page).to have_content("Jake")
    expect(Charge.count).to eq(1)
  end
  scenario "a user can create a new charge from new page" do
    visit new_charge_path

    fill_in "charge[date]", with: "1991-08-28"
    fill_in "charge[payee]", with: "Adam"
    fill_in "charge[notes]", with: "Horrible purchase"
    fill_in "charge[outflow]", with: 20

    click_button "Create"

    expect(current_path).to eq(charges_path)
    expect(page).to have_content("Adam")
    expect(Charge.count).to eq(1)
  end
end
