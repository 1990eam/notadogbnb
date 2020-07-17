# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

Notdog.destroy_all
User.destroy_all
Booking.destroy_all

user = User.create!(email: "test@test.com", password: "test1234", name: "admin", address: "test", phone: "test")

notdog = Notdog.new(name: "Kiss from a Rose", cost_per_day: "100",
                    description: "Le gustan las pelotas", owner: User.first,
                    taxonomy_name: "Seal", taxonomy_category: "Acuático",
                    taxonomy_fantasy_name: "Water Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!


notdog = Notdog.new(name: "Mordelón", cost_per_day: "240",
                    description: "WARNING: No rascarle la nariz", owner: User.first,
                    taxonomy_name: "White Shark", taxonomy_category: "Acuático",
                    taxonomy_fantasy_name: "Bitey Water Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Woodchuck Berkowitz", cost_per_day: "80",
                    description: "Fue Gobernador de California", owner: User.first,
                    taxonomy_name: "Beaver", taxonomy_category: "Acuático/Terrestre",
                    taxonomy_fantasy_name: "Wood Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Fido", cost_per_day: "50",
                    description: "Split Personality Disorder", owner: User.first,
                    taxonomy_name: "Dog", taxonomy_category: "Terrestre",
                    taxonomy_fantasy_name: "Cat",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Viuda", cost_per_day: "180",
                    description: "Ideal para divorcios recientes", owner: User.first,
                    taxonomy_name: "Rattlesnake", taxonomy_category: "Terrestre",
                    taxonomy_fantasy_name: "Danger Noodle Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Abraxas", cost_per_day: "50",
                    description: "Horror cósmico lovecraftiano in fluffy form", owner: User.first,
                    taxonomy_name: "Cat", taxonomy_category: "Terrestre",
                    taxonomy_fantasy_name: "Sharp Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Ojeras", cost_per_day: "150",
                    description: "Ideal para personas nocturnas", owner: User.first,
                    taxonomy_name: "Raccoon", taxonomy_category: "Terrestre",
                    taxonomy_fantasy_name: "Trash Panda Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Melvin", cost_per_day: "230",
                    description: "No recomendable para personas con complejo de inferioridad", owner: User.first,
                    taxonomy_name: "Giraffe", taxonomy_category: "Terrestre",
                    taxonomy_fantasy_name: "Tall Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Tincho", cost_per_day: "60",
                    description: "WARNING: Puede que ya se hable con tus ex", owner: User.first,
                    taxonomy_name: "Vulture", taxonomy_category: "Volador",
                    taxonomy_fantasy_name: "Hide-Your-Girlfriend Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Snowy", cost_per_day: "110",
                    description: "{(@)v(@)}", owner: User.first,
                    taxonomy_name: "Owl", taxonomy_category: "Volador",
                    taxonomy_fantasy_name: "Night Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!

notdog = Notdog.new(name: "Princess Diana", cost_per_day: "110",
                    description: "Cargos extra si se le enseñan improperios o fragmentos del Manifiesto Comunista",
                    owner: User.first,
                    taxonomy_name: "Cockatiel", taxonomy_category: "Volador",
                    taxonomy_fantasy_name: "Copycat Doggo",
                    address: Faker::Address.street_address)
notdog.photo.attach(io:URI.open("https://source.unsplash.com/random/?#{notdog.taxonomy_name}"), filename: "#{notdog.name}.png", content_type: 'image/png')
notdog.save!


# Bookings

10.times do
  i = Notdog.first.id

    notdog = Notdog.find_by(id: i).id
    user = User.first.id

    booking = Booking.new(user_id: user,
                         notdog_id: notdog,
                         start_date: Date.current,
                         end_date: Date.current + 10,
                         price: 100)
  booking.save

  i += 1
end


