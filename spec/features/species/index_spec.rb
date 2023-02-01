require 'rails_helper'

RSpec.describe 'the species index page' do
  it 'displays all species names' do
    species = Species.create!(name: "Elves", Darkvision: false, population: 1500, patron_deity: "Faesren", nation_id: 2)
    species2 = Species.create!(name: "Orcs", Darkvision: true, population: 32000, patron_deity: "Orrug", nation_id: 1)
    visit "/species"

    expect(page).to have_content(species.name)
    expect(page).to have_content(species2.name)
  end

  it 'displays the species ID' do
    species = Species.create!(name: "Elves", Darkvision: false, population: 1500, patron_deity: "Faesren", nation_id: 2)
    species2 = Species.create!(name: "Orcs", Darkvision: true, population: 32000, patron_deity: "Orrug", nation_id: 1)
    visit "/species"

    expect(page).to have_content(species.id)
    expect(page).to have_content(species2.id)
  end

  it 'displays the species darkvision boolean' do
    species = Species.create!(name: "Elves", Darkvision: false, population: 1500, patron_deity: "Faesren", nation_id: 2)
    species2 = Species.create!(name: "Orcs", Darkvision: true, population: 32000, patron_deity: "Orrug", nation_id: 1)
    visit "/species"

    expect(page).to have_content(species.name)
    expect(page).to have_content(species2.name)
  end

  it 'displays the species population' do
    species = Species.create!(name: "Elves", Darkvision: false, population: 1500, patron_deity: "Faesren", nation_id: 2)
    species2 = Species.create!(name: "Orcs", Darkvision: true, population: 32000, patron_deity: "Orrug", nation_id: 1)
    visit "/species"

    expect(page).to have_content(species.name)
    expect(page).to have_content(species2.name)
  end

  it 'displays the species patron deity' do
    species = Species.create!(name: "Elves", Darkvision: false, population: 1500, patron_deity: "Faesren", nation_id: 2)
    species2 = Species.create!(name: "Orcs", Darkvision: true, population: 32000, patron_deity: "Orrug", nation_id: 1)
    visit "/species"

    expect(page).to have_content(species.name)
    expect(page).to have_content(species2.name)
  end

  it 'displays the species nation ID' do
    species = Species.create!(name: "Elves", Darkvision: false, population: 1500, patron_deity: "Faesren", nation_id: 2)
    species2 = Species.create!(name: "Orcs", Darkvision: true, population: 32000, patron_deity: "Orrug", nation_id: 1)
    visit "/species"

    expect(page).to have_content(species.name)
    expect(page).to have_content(species2.name)
  end
end