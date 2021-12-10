# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dog.destroy_all

@daisy = Dog.create({
  dog_name: "Daisy",
  password_digest: "Daisy123",
  address_one: "139 Petunia Terrace SE",
  city: "Leesburg",
  zip_code: "20175",
  state: "Virginia",
  email: "Daisy@gmail.com",
  lat: "39.092750",
  lng: "-77.555280"
})
@hamilton = Dog.create({
  dog_name: "Hamilton",
  password_digest: "Hamilton123",
  address_one: "21179 Ashburn Heights Dr.",
  city: "Ashburn",
  zip_code: "20148",
  state: "Virginia",
  email: "Hamilton@gmail.com",
  lat: "39.031080",
  lng: "-77.527580"
})
@biggie = Dog.create({
  dog_name: "Biggie",
  password_digest: "Biggie123",
  address_one: "1605 Village Market Blvd SE",
  address_two: "J303",
  city: "Leesburg",
  zip_code: "20175-5108",
  state: "Virginia",
  email: "Biggie@gmail.com",
  lat: "39.089130",
  lng: "-77.524100"
})

Message.destroy_all

Message.create!([{
  dog_to: @daisy.id,
  dog_id: @hamilton.id,
  message: "Hi Daisy! Hope we can play some day!"
},
{
  dog_to: @hamilton.id,
  dog_id: @daisy.id,
  message: "Hi Hamilton! I would love to play this weekend."
},
{
  dog_to: @hamilton.id,
  dog_id: @daisy.id,
  message: "Let me talk to my parents and see if they will drive me!"
},
{
  dog_to: @biggie.id,
  dog_id: @daisy.id,
  message: "Hi Biggie! Do you remember we played together at the park."
},
{
  dog_to: @daisy.id,
  dog_id: @biggie.id,
  message: "Yes I do Daisy."
},
{
  dog_to: @biggie.id,
  dog_id: @daisy.id,
  message: "Sweet!"
}])
