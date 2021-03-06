require 'rails_helper'

RSpec.describe "Pet Show page" do
  it "I see a link to update that Pet" do
    updated_name = 'Rudolpho'
    shelter = create(:shelter)
    pet = create(:pet, shelter: shelter)
    visit "/pets/#{pet.id}"
    expect(page).to have_content(pet.name)
    click_link("Update Pet")

    expect(current_path).to eq("/pets/#{pet.id}/edit")

    fill_in('pet_name', :with => updated_name)

    expect do
      click_button("Update Pet")
    end.to change { pet.reload.name }

    expect(current_path).to eq("/pets/#{pet.id}")
    expect(page.find("img#pet-image-#{pet.id}")).to be_truthy
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.description)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
  end
end


# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
