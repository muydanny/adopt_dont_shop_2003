require 'rails_helper'

RSpec.describe "When I visit '/pets/:id' " do
  it "I see a pet's image, name, description, age, sex and status" do
    shelter = create(:shelter)
    pet = create(:pet, shelter: shelter)

    visit "/pets/#{pet.id}"


    expect(page.find("img#pet-image-#{pet.id}")).to be_truthy
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content("Adoptable: #{pet.adoptable}")
  end
end


# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
