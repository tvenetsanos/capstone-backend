# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

@tyler = User.create({
  name: "Tyler Venetsanos",
  password_digest: "tyler123",
  address_one: "139 Petunia Terrace SE",
  city: "Leesburg",
  zip_code: "20175",
  state: "Virginia",
  email: "tyler@gmail.com",
  lat: "39.092750",
  lng: "-77.555280"
})

@kosta = User.create({
  name: "Kosta Venetsanos",
  password_digest: "kosta123",
  address_one: "1605 Village Market Blvd SE",
  address_two: "J303",
  city: "Leesburg",
  zip_code: "20175-5108",
  state: "Virginia",
  email: "kosta@gmail.com",
  lat: "39.089130",
  lng: "-77.524100"
})

@devin = User.create({
  name: "Devin Venetsanos",
  password_digest: "devin123",
  address_one: "21179 Ashburn Heights",
  city: "Ashburn",
  zip_code: "20148",
  state: "Virginia",
  email: "devin@gmail.com",
  lat: "39.089130",
  lng: "-77.524100"
})

Dog.destroy_all

@daisy = Dog.create({
  dog_name: "Daisy",
  breed: "Yellow Lab",
  age: 14,
  user_id: @tyler.id
})

@hamilton = Dog.create({
  dog_name: "Hamilton",
  breed: "Golden Retriever",
  age: 1,
  user_id: @devin.id
})

@biggie = Dog.create({
  dog_name: "Biggie",
  breed: "Yorkie",
  age: 13,
  user_id: @kosta.id
})

Conversation.destroy_all
@conversation1 = Conversation.create({
  first_user_id: @tyler.id,
  second_user_id: @devin.id
})

@conversation2 = Conversation.create({
  first_user_id: @tyler.id,
  second_user_id: @kosta.id
})

Message.destroy_all

Message.create!([{
  user_id: @devin.id,
  conversation_id: @conversation1.id,
  message: "Hi Tyler! I would love to get the dogs together to play!"
},
{
  user_id: @tyler.id,
  conversation_id: @conversation1.id,
  message: "Hi Devin. Lets schedule something for this weekend!"
},
{
  user_id: @devin.id,
  conversation_id: @conversation1.id,
  message: "That would be a lot of fun!"
},
{
  user_id: @tyler.id,
  conversation_id: @conversation2.id,
  message: "Hi Kosta! Do you remember our dogs played together at the park."
},
{
  user_id: @kosta.id,
  conversation_id: @conversation2.id,
  message: "Yes I do Tyler."
},
{
  user_id: @tyler.id,
  conversation_id: @conversation2.id,
  message: "Sweet!"
}])
