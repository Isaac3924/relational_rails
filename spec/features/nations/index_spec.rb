require 'rails_helper'

RSpec.describe 'Nations index' do
  before :each do
    @nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
  end

  it 'shows all of the names of the nations' do
    visit "/nations"
    
    expect(page).to have_content(@nation.name)
    expect(page).to have_content(@nation2.name)
  end

  it 'shows all of the names of the nations by most recently created and shows when created next to it' do
    nation3 = Nation.create!(name: "L", landlocked: false, population: 9, national_language: "Lastish")
    nation4= Nation.create!(name: "Last", landlocked: false, population: 9, national_language: "Lastish")
    nation5 = Nation.create!(name: "Lastla", landlocked: false, population: 9, national_language: "Lastish")
    nation6 = Nation.create!(name: "Lastland", landlocked: false, population: 9, national_language: "Lastish")
    visit "/nations"
    save_and_open_page
    expect(page).to have_content(@nation.name)
    expect(page).to have_content(@nation2.name)
    expect(page).to have_content(nation6.name)
  end
end