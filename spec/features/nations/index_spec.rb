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

    expect(page).to have_content(@nation.name)
    expect(page).to have_content(@nation2.name)
  end

  it 'has a link that leads to the child index' do
    visit "/nations"

    save_and_open_page
    click_on "Ancestries Index"
    expect(current_path).to eq ("/ancestries")
  end

  it 'has a link that leads to the parent index' do
    visit "/nations"

    
    click_on "Nations Index"
    expect(current_path).to eq ("/nations")
  end

  it 'has a link that leads to the nations edit page' do
    visit "/nations"

    expect(page).to have_content("Update #{@nation.name}")
    expect(page).to have_content("Update #{@nation2.name}")
    save_and_open_page
    click_on "Update #{@nation.name}"
    expect(current_path).to eq ("/nations/#{@nation.id}/edit")
  end
end