# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'destroying a nation (which sounds METAL)' do
  before :each do
    @nation = Nation.create!(name: "delete_me1", landlocked: false, population: 1, national_language: "DO IT")
    @nation2 = Nation.create!(name: "delete_me2", landlocked: false, population: 1, national_language: "DO IT")
    @ancestry = @nation.ancestries.create!(name: "Destroy1", darkvision: true, population: 2, patron_deity: "Nihil")
    @ancestry2 = @nation.ancestries.create!(name: "Destroy2", darkvision: true, population: 3, patron_deity: "Orrug")
  end

  it 'has a link indicating deletion' do
    visit "/nations/#{@nation.id}"
  
    expect(page).to have_content("Delete #{@nation.name}")
  end
    
  it 'can destroy the nation' do
    visit "/nations/#{@nation.id}"

    expect(page).to have_content('delete_me1')

    click_link "Delete #{@nation.name}"
    save_and_open_page
      
    expect(current_path).to eq("/nations")
    expect(page).to_not have_content("delete_me1")
  end

  it 'can destroy the ancestries' do
    visit "/ancestries"
    expect(page).to have_content('Destroy1')
    expect(page).to have_content('Destroy2')

    visit "/nations/#{@nation.id}"
    click_link "Delete #{@nation.name}"
    visit "/ancestries"
    
    expect(current_path).to eq("/ancestries")
    expect(page).to_not have_content("Destroy1")
    expect(page).to_not have_content("Destroy2")
  end
  
  it 'has links indicating deletion on index page' do
    visit "/nations"
    
    expect(page).to have_content("Delete #{@nation.name}")
    expect(page).to have_content("Delete #{@nation2.name}")
  end
    
  it 'can destroy the nation from the index' do
    visit "/nations"

    expect(page).to have_content('delete_me')

    click_link "Delete #{@nation.name}"
      
    expect(current_path).to eq("/nations")
    expect(page).to have_content("delete_me")
  end

  it 'can destroy the ancestries the nation index' do
    visit "/ancestries"
    expect(page).to have_content('Destroy')
    expect(page).to have_content('Destroy2')

    visit "/nations"
    click_link "Delete #{@nation.name}"
    visit "/ancestries"
    save_and_open_page
      
    expect(current_path).to eq("/ancestries")
    expect(page).to_not have_content("Destroy1")
    expect(page).to_not have_content("Destroy2")
  end
end