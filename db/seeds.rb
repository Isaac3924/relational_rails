# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@Ghornsby = Nation.create!(name: 'Ghornsby', landlocked: false, population: 35900, national_language: "Ghornish")
@Sylvania = Nation.create!(name: 'Sylvania', landlocked: true, population: 23000, national_language: "Sylvan")
@Ostlands = Nation.create!(name: 'Ostlands', landlocked: true, population: 79000, national_language: "Ost")


@Ghornsby.ancestries.create!(name: "Dwarves", darkvision: true, population: 19000, patron_deity: "Dorfgunir")
@Ghornsby.ancestries.create!(name: "Humans", darkvision: false, population: 2500, patron_deity: "Oceanus")
@Sylvania.ancestries.create!(name: "Elves", darkvision: false, population: 12000, patron_deity: "Faesren")
@Sylvania.ancestries.create!(name: "Vampires", darkvision: true, population: 10500, patron_deity: "Nagathis")
@Ostlands.ancestries.create!(name: "Orcs", darkvision: true, population: 53000, patron_deity: "Orrug")