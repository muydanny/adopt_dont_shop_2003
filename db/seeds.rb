# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.create(name: "Dumb Friends League", address: "1191 Yuma St", city: "Denver", state: "CO", zip: 80223)
Shelter.create(name: "Pick a Pet", address: "1234 Fake St", city: "Denver", state: "CO", zip: 80209)
Shelter.create(name: "Pets!", address: "1111 Random Ave", city: "Denver", state: "CO", zip: 80223)
shelter_1 = Shelter.create(name: "Lizards R US", address: "900 S Cir", city: "Denver", state: "CO", zip: 80205)
Shelter.create(name: "Lions and House Cats Only", address: "44 Elm St", city: "Denver", state: "CO", zip: 81005)
Shelter.create(name: "Big Al's House", address: "605 8th St", city: "Denver", state: "CO", zip: 83023)
Shelter.create(name: "Paws, Prints, and Pies", address: "333 N St", city: "Denver", state: "CO", zip: 84223)
shelter_2 = Shelter.create(name: "Free Animals", address: "101 Pearl St", city: "Denver", state: "CO", zip: 80123)

pet_1 = Pet.create(image: "https://whatyouth.com/wp-content/uploads/2016/03/whatyouth_lizard_submission_photo-256x256.jpg",
                   name: "Frank",
                   approximate_age: 3,
                   sex: "Female",
                   adoptable: "Yes",
                   description: "Cute",
                   shelter_id: shelter_1.id)

pet_2 = Pet.create(image: "https://i.pinimg.com/474x/81/28/2f/81282fc4a8547a306f43ba5354ed6697.jpg",
                   name: "Uzi",
                   approximate_age: 8,
                   sex: "Male",
                   adoptable: "Yes",
                   description: "Cute",
                   shelter_id: shelter_2.id)
