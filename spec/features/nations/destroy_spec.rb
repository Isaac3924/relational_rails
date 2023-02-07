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
    @nation = Nation.create!(name: "delete_me", landlocked: false, population: 1, national_language: "DO IT")
  end

  it 'has a link indicating deletion' do
    visit "/nations/#{@nation.id}"
  
    expect(page).to have_content("Delete #{@nation.name}")
  end
    
#   it 'can destroy the nation' do
#     visit "/nations/#{@nation.id}"

#     expect(page).to have_content('delete_me')

#     click_link "Delete #{@nation.name}"
#     save_and_open_page
      
#     expect(current_path).to eq("/nations")
#     expect(page).to_not have_content("delete_me")
#   end
end