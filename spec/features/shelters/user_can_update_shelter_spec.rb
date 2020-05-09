require 'rails_helper'

RSpec.describe "Update shelter" do
  it "can update a shelter" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                               address: "1191 Yuma St",
                               city: "Denver",
                               state: "CO",
                               zip: 80223)
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("Dumb Friends League")
    click_link("Update Shelter")

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    # find field by ID, fill in field
    fill_in('shelter_name', :with => 'Smart Friends League')

    click_button("Submit Form")

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Smart Friends League")
    expect(page).to have_content("1191 Yuma St")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content(80223)
    expect(page).not_to have_content("Dumb Friends League")
  end
end

# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"~~
# Then I am taken to '/shelters/:id/edit' where I  see a form
# to edit the shelter's data
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
#  and I am redirected to the Shelter's Show page where I see the shelter's updated info
