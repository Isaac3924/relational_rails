# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'the Ancestry edit' do
  before :each do
    @nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: true, population: 212, national_language: "Bjornish")
    @ancestry = @nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    @ancestry2 = @nation2.ancestries.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
  end

  it 'has a link to ancestries/edit from the ancestries show page' do
    visit "/ancestries/#{@ancestry.id}"
    click_link "Update #{@ancestry.name}"
    
    expect(current_path).to eq ("/ancestries/#{@ancestry.id}/edit")
  end
    
  it 'can edit the ancestor' do
    visit "/ancestries/#{@ancestry.id}"

    expect(page).to have_content('Elves')

    click_link "Update #{@ancestry.name}"
    
    fill_in('Name', with: 'Delves')
    fill_in('Darkvision', with: 'true')
    fill_in('Population', with: '500')
    fill_in('Patron deity', with: 'Daesren')
    click_button('Update Ancestry')
    save_and_open_page
      
    expect(current_path).to eq("/ancestries/#{@ancestry.id}")
    expect(page).to have_content("Delves")
  end
end