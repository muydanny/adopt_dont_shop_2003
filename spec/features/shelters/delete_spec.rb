require 'rails_helper'

RSpec.describe "Delete a shelter" do
  it "I can delete a shelter" do
        shelter_1 = Shelter.create(name: "Dumb Friends League",
                                  address: "1191 Yuma St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 80223)
        shelter_2 = Shelter.create(name: "Pick a Pet",
                                  address: "123 Fake St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 80209)

    visit '/shelters'
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

    visit "/shelters/#{shelter.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Dumb Friends League")
    expect(page).to_not have_content("1191 Yuma St")
    expect(page).to_not have_content("Denver")
    expect(page).to_not have_content("CO")
    expect(page).to_not have_content(80223)
    expect(page).to have_content(shelter_2.name)
    
  end
end

# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where
# I no longer see this shelter
