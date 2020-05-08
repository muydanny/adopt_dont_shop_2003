require 'rails_helper'

RSpec.describe "When I visit /pets" do
  it "I can see all pets in the system" do
    shelter_3 = Shelter.create(name: "Lizards R US")
    shelter_4 = Shelter.create(name: "Rat City")
    pet_1 = Pet.create(image: "lizard",
                       name: "Frank",
                       approximate_age: 3,
                       sex: "Female",
                       shelter_id: shelter_3.id)

    pet_2 = Pet.create(image: "rat",
                       name: "Uzi",
                       approximate_age: 8,
                       sex: "Male",
                       shelter_id: shelter_4.id)

    visit '/pets'

    expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content("Shelter: #{shelter_3.name}")
    expect(page).to have_content(pet_2.image)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content("Shelter: #{shelter_4.name}")
  end
end


# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
