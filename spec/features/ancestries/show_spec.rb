require 'rails_helper'

RSpec.describe 'the ancestries show page' do
  before :each do
    @nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: true, population: 212, national_language: "Bjornish")
    @ancestry = @nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    @ancestry2 = @nation2.ancestries.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
  end
  it 'displays the ancestry name' do
    visit "/ancestries/#{@ancestry.id}"

    expect(page).to have_content(@ancestry.name)
    expect(page).to_not have_content(@ancestry2.name)
  end

  it 'displays the ancestry darkvision boolean' do
    visit "/ancestries/#{@ancestry.id}"

    expect(page).to have_content(@ancestry.darkvision)
    expect(page).to_not have_content(@ancestry2.darkvision)
  end

  it 'displays the ancestry population' do
    visit "/ancestries/#{@ancestry.id}"

    expect(page).to have_content(@ancestry.population)
    expect(page).to_not have_content(@ancestry2.population)
  end

  it 'displays the ancestry patron_deity' do
    visit "/ancestries/#{@ancestry.id}"

    expect(page).to have_content(@ancestry.patron_deity)
    expect(page).to_not have_content(@ancestry2.patron_deity)
  end

  it 'has a link that leads to the child index' do
    visit "/ancestries/#{@ancestry.id}"
    
    click_on "Ancestries Index"
    expect(current_path).to eq ("/ancestries")
  end

  it 'has a link that leads to the parent index' do
    visit "/ancestries/#{@ancestry.id}"

    save_and_open_page
    click_on "Nations Index"
    expect(current_path).to eq ("/nations")
  end
end