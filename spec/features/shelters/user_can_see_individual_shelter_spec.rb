require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can see an individual shelter" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                              address: "1191 Yuma St",
                              city: "Denver",
                              state: "CO",
                              zip: 80223)
    shelter_2 = Shelter.create(name: "Pick a Pal",
                              address: "123 Fake St",
                              city: "Denver",
                              state: "CO",
                              zip: 80209)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
