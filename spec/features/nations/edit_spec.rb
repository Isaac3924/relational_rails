# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'the Nation edit' do
  before :each do
    @nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
  end

  it 'has a link to nations/edit from the nations show page' do
    visit "/nations/#{@nation.id}"
  
    click_link "Update #{@nation.name}"
    expect(current_path).to eq ("/nations/#{@nation.id}/edit")
  end
    
  # it 'can create new nation' do
  #   visit "/nations/#{@ancestry.id}"
      
  #   fill_in('Name', with: 'test')
  #   fill_in('Landlocked', with: 'true')
  #   fill_in('Population', with: '12341')
  #   fill_in('National language', with: 'testish')
  #   click_button('Create Nation')
      
  #   new_nation_id = Nation.last.id
  #   save_and_open_page
  #   expect(current_path).to eq("/nations")
  #   expect(page).to have_content("test: #{Nation.last.created_at}")
  # end
end