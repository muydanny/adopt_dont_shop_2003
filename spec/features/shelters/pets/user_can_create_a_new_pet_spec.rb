require 'rails_helper'

RSpec.describe "When I visit a Shelter Pets Index page" do
  it "can create a new shelter" do
    visit '/shelters/:shelter_id/pets'
    shelter = create(:shelter)
    pet = create(:pet, shelter: shelter)
    expect(page).to have_content("All Pets")
    expect(page).not_to have_content("Pet name")

    click_button("Create Pet")

    expect(current_path).to eq '/shelters/:shelter_id/pets/new'
    expect(page).to have_content("Create a new Pet")

    fill_in('pet_image', :with => 'Pet Image')
    fill_in('pet_name', :with => 'Pet Name')
    fill_in('pet_description', :with => 'Pet Description')
    fill_in('pet_age', :with => 'Pet age')
    fill_in('pet_sex', :with => 'Female or Male')

    click_button("Create Pet")

    expect(current_path).to eq '/shelters/:shelter_id/pets'

    expect(page).to have_content("Pet name")
  end
end


# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
