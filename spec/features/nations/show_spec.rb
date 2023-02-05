require 'rails_helper'

RSpec.describe 'the nations show page' do
  it 'displays the nation name' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"

    expect(page).to have_content(nation.name)
    expect(page).to_not have_content(nation2.name)
  end

  it 'displays the nation landlocked boolean' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: true, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"

    expect(page).to have_content(nation.landlocked)
    expect(page).to_not have_content(nation2.landlocked)
  end

  it 'displays the nation population' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"

    expect(page).to have_content(nation.population)
    expect(page).to_not have_content(nation2.population)
  end

  it 'displays the nation national_language' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"
    
    expect(page).to have_content(nation.national_language)
    expect(page).to_not have_content(nation2.national_language)
  end

  it 'displays a count of the nations'' children' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    ancestry = nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    ancestry2 = nation.ancestries.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    ancestry3 = nation2.ancestries.create!(name: "Dwarves", darkvision: true, population: 150000, patron_deity: "Dorfgunir")
    visit "/nations/#{nation.id}"

    expect(page).to have_text("Ancestry count: 2")
    expect(page).to_not have_text("Ancestry count: 1")
  end

  it 'has a link that leads to the child index' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    ancestry = nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    visit "/nations/#{nation.id}"
    click_on "Ancestries Index"
    expect(current_path).to eq ("/ancestries")
  end

  it 'has a link that leads to the parent index' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    ancestry = nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    visit "/nations/#{nation.id}"
    save_and_open_page
    click_on "Nations Index"
    expect(current_path).to eq ("/nations")
  end
end