require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all names of the shelters in system" do
    shelter_1 = Shelter.create(name: "Dumb Friends League")
    shelter_2 = Shelter.create(name: "Pick a Pal")

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
