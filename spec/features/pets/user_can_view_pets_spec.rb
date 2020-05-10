require 'rails_helper'

RSpec.describe "When I visit /pets" do
  it "I can see all pets in the system" do
    shelter_3 = Shelter.create(name: "Lizards R US")
    shelter_4 = Shelter.create(name: "Rat City")
    pet_1 = Pet.create(image: "https://whatyouth.com/wp-content/uploads/2016/03/whatyouth_lizard_submission_photo-256x256.jpg",
                       name: "Frank",
                       approximate_age: 3,
                       sex: "Female",
                       shelter_id: shelter_3.id)

    pet_2 = Pet.create(image: "https://i.pinimg.com/474x/81/28/2f/81282fc4a8547a306f43ba5354ed6697.jpg",
                       name: "Uzi",
                       approximate_age: 8,
                       sex: "Male",
                       shelter_id: shelter_4.id)

    visit '/pets'

    expect(page.find("img#pet-image-#{pet_1.id}")).to be_truthy
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content("Shelter: #{shelter_3.name}")
    expect(page.find("img#pet-image-#{pet_2.id}")).to be_truthy
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content("Shelter: #{shelter_4.name}")
    expect(all("Update Pet")).to be_truthy
    # expect(find_link("Delete Pet")).to be_truthy
  end


end
