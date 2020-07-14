# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user = User.create!(email: "test@test.com", password: "test1234", name: "admin", address: "test", phone: "test")

notdog = Notdog.new(name: "Kiss from a Rose", cost_per_day: "100", description: "Likes balls", owner: User.first, taxonomy: Taxonomy.find_by_name("foca"))
notdog.save
taxonomy = Taxonomy.new(name: "Foca", category: "Acuático", fantasy_name: "Water Doggo")

taxonomy.notdog = notdog
taxonomy.save


# Taxonomy.create!(name: "Tiburón Blanco", category: "Acuático", fantasy_name: "Bitey Water Doggo")

# Taxonomy.create!(name: "Castor", category: "Acuático/Terrestre", fantasy_name: "Wood Doggo")

# Taxonomy.create!(name: "Perro", category: "Terrestre", fantasy_name: "Cat")

# Taxonomy.create!(name: "Serpiente", category: "Terrestre", fantasy_name: "Danger Noodle Doggo")

# Taxonomy.create!(name: "Gato", category: "Terrestre", fantasy_name: "Sharp Doggo")

# Taxonomy.create!(name: "Mapache", category: "Terrestre", fantasy_name: "Trash Panda Doggo")

# Taxonomy.create!(name: "Jirafa", category: "Terrestre", fantasy_name: "Tall Doggo")

# Taxonomy.create!(name: "Buitre", category: "Volador", fantasy_name: "Hide-Your-Girlfriend Doggo")

# Taxonomy.create!(name: "Lechuza", category: "Volador", fantasy_name: "Night Doggo")

# Taxonomy.create!(name: "Cacatúa", category: "Volador", fantasy_name: "Copycat Doggo")
