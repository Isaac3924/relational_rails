require 'rails_helper'

RSpec.describe 'the species index page' do
  it 'displays all species names' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    species = nation.species.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    species2 = nation2.species.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    require 'pry'; binding.pry
    visit "/species"
    require 'pry'; binding.pry
    expect(page).to have_content(species.name)
    expect(page).to have_content(species2.name)
  end

  it 'displays the species ID' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    species = nation.species.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    species2 = nation2.species.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    visit "/species"

    expect(page).to have_content(species.id)
    expect(page).to have_content(species2.id)
  end

  it 'displays the species darkvision boolean' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    species = nation.species.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    species2 = nation2.species.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    visit "/species"

    expect(page).to have_content(species.darkvision)
    expect(page).to have_content(species2.darkvision)
  end

  it 'displays the species population' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    species = nation.species.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    species2 = nation2.species.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    visit "/species"

    expect(page).to have_content(species.population)
    expect(page).to have_content(species2.population)
  end

  it 'displays the species patron deity' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    species = nation.species.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    species2 = nation2.species.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    visit "/species"

    expect(page).to have_content(species.patron_deity)
    expect(page).to have_content(species2.patron_deity)
  end

  it 'displays the species nation ID' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    species = nation.species.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    species2 = nation2.species.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    visit "/species"

    expect(page).to have_content(species.nation_id)
    expect(page).to have_content(species2.nation_id)
  end
end