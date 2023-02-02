require 'rails_helper'

RSpec.describe 'Nations index' do

  it 'shows all of the names of the nations' do
		nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations"
    save_and_open_page
    expect(page).to have_content(nation.name)
    expect(page).to have_content(nation2.name)
  end

  
end