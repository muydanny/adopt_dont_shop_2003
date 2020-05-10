require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all names of the shelters in system" do
    shelter_1 = Shelter.create(name: "Dumb Friends League")

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(find_link("Update Shelter")).to be_truthy
  end
end
