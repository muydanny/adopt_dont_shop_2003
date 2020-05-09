require 'rails_helper'

RSpec.describe "When I visit a Shelter Pets Index page" do
  it "can create a new shelter" do
    shelter = create(:shelter)
    pet = create(:pet, shelter: shelter)

    visit "/shelters/#{shelter.id}/pets"
    expect(find_button("Create Pet")).to be_truthy
    expect(page).not_to have_content("Pet Name")

    click_button("Create Pet")

    expect(current_path).to eq "/shelters/#{shelter.id}/pets/new"
    expect(page).to have_content("Create a new Pet")

    fill_in('pet_image', :with => 'https://whatyouth.com/wp-content/uploads/2016/03/whatyouth_lizard_submission_photo-256x256.jpg')
    fill_in('pet_name', :with => 'Pet Name')
    fill_in('pet_description', :with => 'Pet Description')
    fill_in('pet_approximate_age', :with => 'Pet age')
    fill_in('pet_sex', :with => 'Female or Male')

    click_button("Create Pet")

    expect(current_path).to eq "/shelters/#{shelter.id}/pets"

    expect(page).to have_content("Pet Name")
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
