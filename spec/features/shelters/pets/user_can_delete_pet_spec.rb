require 'rails_helper'

RSpec.describe "When I visit a pet show page" do
  it "I see a link to delete the pet" do
    shelter = create(:shelter)
    pet = create(:pet, shelter: shelter)

    visit "/pets"
    expect(page).to have_content(pet.name)

    visit "/pets/#{pet.id}"

    click_link("Delete Pet")

    expect(current_path).to eq("/pets")
    expect(page).not_to have_css("img#pet-image-#{pet.id}")
    expect(page).not_to have_content(pet.name)
    expect(page).not_to have_content(pet.description)
    expect(page).not_to have_content(pet.approximate_age)
    expect(page).not_to have_content(pet.sex)
  end
end



# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page
# where I no longer see this pet
