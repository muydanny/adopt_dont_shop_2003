require 'rails_helper'

RSpec.describe "shelters create page", type: :feature do
  it "can create a new shelter" do
    visit "/shelters"
    expect(page).to have_content("All Shelters")
    expect(page).not_to have_content("Shelter name")

    click_button("New Shelter")

    expect(current_path).to eq new_shelter_path
    expect(page).to have_content("Create a new Shelter")

    # find field by ID, fill in field
    fill_in('shelter_name', :with => 'Shelter name')
    fill_in('shelter_address', :with => 'Shelter address')
    fill_in('shelter_city', :with => 'Shelter city')
    fill_in('shelter_state', :with => 'Shelter state')
    fill_in('shelter_zip', :with => 'Shelter zip')

    click_button("Create Shelter")

    expect(current_path).to eq shelters_path

    expect(page).to have_content("Shelter name")
  end
end
