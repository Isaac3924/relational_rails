# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'the Ancestry creation' do
  before :each do
		@nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    @ancestry = @nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    @ancestry2 = @nation.ancestries.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    @ancestry3 = @nation2.ancestries.create!(name: "Dwarves", darkvision: true, population: 150000, patron_deity: "Dorfgunir")
  end

  it 'has a link to /nations/:nation_id/ancestries/new from the nations ancestries index page' do
    visit "/nations/#{@nation.id}/ancestries"
    click_link "Create Ancestry"
    save_and_open_page
    expect(current_path).to eq ("/nations/#{@nation.id}/ancestries/new")
  end
  
  it 'can create new child' do
    visit "/nations/#{@nation.id}/ancestries/new"
    
    fill_in('Name', with: 'Zombies')
    fill_in('Darkvision', with: 'true')
    fill_in('Population', with: '470823326')
    fill_in('Patron deity', with: 'Shrike')
    click_button('Create Ancestry')
    
    new_ancestry_id = Ancestry.last.id
    require 'pry'; binding.pry
    save_and_open_page
    expect(current_path).to eq("/nations/#{@nation.id}/ancestries")
    expect(page).to have_content("Zombies")
  end
end