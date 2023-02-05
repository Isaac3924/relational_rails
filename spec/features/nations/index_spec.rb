require 'rails_helper'

RSpec.describe 'Nations index' do
  before :each do
    @nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish", created_at: "2023-02-03 21:55:27 UTC")
  end

  it 'shows all of the names of the nations' do
    visit "/nations"
    
    expect(page).to have_content(@nation.name)
    expect(page).to have_content(@nation2.name)
  end

  it 'shows all of the names of the nations by most recently created and shows when created next to it' do
    visit "/nations"
    save_and_open_page
    expect(page).to have_content(@nation.name)
    expect(page).to have_content(@nation2.name)
  end

  it 'has a link that leads to the child index' do
    visit "/nations"

    click_on "Ancestries Index"
    save_and_open_page
    expect(current_path).to eq ("/ancestries")
  end
end