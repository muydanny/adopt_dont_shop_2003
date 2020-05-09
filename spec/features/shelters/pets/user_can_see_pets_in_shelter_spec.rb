
require 'rails_helper'

RSpec.describe "When I visit /shelters/:shelter_id/pets" do
  context "when a shelter can't be found" do
  end
  context "when a shelter exists" do
    context "without any pets"
    it "lists adoptable pets" do
      shelter = create(:shelter)
      pet = create(:pet, shelter: shelter)

      visit "/shelters/#{shelter.id}/pets"

      expect(page.find("img#pet-image-#{pet.id}")).to be_truthy
      expect(page).to have_content(pet.name)
      expect(page).to have_content(pet.approximate_age)
      expect(page).to have_content(pet.sex)
      expect(page).to have_content("Shelter: #{shelter.name}")
    end
  end
end




  # could copy everything from this test and make another pet and make sure
  # nothing from this pet
    # As a visitor
    # When I visit '/shelters/:shelter_id/pets'
    # Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
    # - image
    # - name
    # - approximate age
    # - sex
