require 'rails_helper'

RSpec.describe 'Nations ancestries index' do
  before :each do
		@nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    @ancestry = @nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    @ancestry2 = @nation.ancestries.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    @ancestry3 = @nation2.ancestries.create!(name: "Dwarves", darkvision: true, population: 150000, patron_deity: "Dorfgunir")
  end

  it 'shows all of the names of the ancestries for the nation' do
		visit "/nations/#{@nation.id}/ancestries"

    expect(page).to have_content(@ancestry.name)
    expect(page).to have_content(@ancestry2.name)
    expect(page).to_not have_content(@ancestry3.name)
  end

  it 'displays the ancestries ID' do
    visit "/nations/#{@nation.id}/ancestries"

    expect(page).to have_content(@ancestry.id)
    expect(page).to have_content(@ancestry2.id)
    expect(page).to_not have_content(@ancestry3.id)
  end

  it 'displays the ancestries darkvision boolean' do
    visit "/nations/#{@nation.id}/ancestries"

    expect(page).to have_content(@ancestry.darkvision)
    expect(page).to have_content(@ancestry2.darkvision)
  end

  it 'displays the ancestries population' do
    visit "/nations/#{@nation.id}/ancestries"

    expect(page).to have_content(@ancestry.population)
    expect(page).to have_content(@ancestry2.population)
    expect(page).to_not have_content(@ancestry3.population)
  end

  it 'displays the ancestries patron deity' do
    visit "/nations/#{@nation.id}/ancestries"

    expect(page).to have_content(@ancestry.patron_deity)
    expect(page).to have_content(@ancestry2.patron_deity)
    expect(page).to_not have_content(@ancestry3.patron_deity)
  end

  it 'displays the ancestries nation ID' do
    visit "/nations/#{@nation.id}/ancestries"
    
    expect(page).to have_content(@ancestry.nation_id)
    expect(page).to have_content(@ancestry2.nation_id)
    expect(page).to_not have_content(@ancestry3.nation_id)
  end

  it 'has a link that leads to the child index' do
    visit "/nations/#{@nation.id}/ancestries"
    click_on "Ancestries Index"

    expect(current_path).to eq ("/ancestries")
  end

  it 'has a link that leads to the parent index' do
    visit "/nations/#{@nation.id}/ancestries"

    click_on "Nations Index"
    expect(current_path).to eq ("/nations")
  end

  it 'has a link that does not lead to another page' do
    visit "/nations/#{@nation.id}/ancestries"

    click_on "Sort Alphabetically"
    save_and_open_page
    expect(current_path).to eq ("/nations/#{@nation.id}/ancestries")
  end
end