require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can see an individual shelter" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("Address: #{shelter_1.address}")
    expect(page).to have_content("City: #{shelter_1.city}")
    expect(page).to have_content("State: #{shelter_1.state}")
    expect(page).to have_content("Zip: #{shelter_1.zip}")
    expect(page).not_to have_content(shelter_2.name)
  end
end

[ ] done

User Story 9, Pet Show

As a visitor
When I visit '/pets/:id'
Then I see the pet with that id including the pet's:
- image
- name
- description
- approximate age
- sex
- adoptable/pending adoption status
