# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'the Nation creation' do
  it 'has a link to nations/new from the nations index page' do
    visit "/nations"

    click_link "New Nation"
    expect(current_path).to eq ("/nations/new")
  end
  
  it 'can create new nation' do
    visit '/nations/new'
    
    fill_in('Name', with: 'test')
    fill_in('Landlocked', with: 'true')
    fill_in('Population', with: '12341')
    fill_in('National language', with: 'testish')
    click_button('Create Nation')
    
    new_nation_id = Nation.last.id
    save_and_open_page
    expect(current_path).to eq("/nations")
    expect(page).to have_content("test: #{Nation.last.created_at}")
  end
end