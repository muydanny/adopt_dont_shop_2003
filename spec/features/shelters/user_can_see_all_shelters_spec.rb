require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all names of the shelters in system" do
    it "can click a link next to every shelter name to edit info"
    shelter_1 = Shelter.create(name: "Dumb Friends League")
    shelter_2 = Shelter.create(name: "Pick a Pal")

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    expect(page.find("/shelters/#{shelter.id}/edit")).to be_truthy
  end
end
