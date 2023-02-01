require 'rails_helper'

RSpec.describe 'the nations show page' do
  it 'displays the nation name' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"

    expect(page).to have_content(nation.name)
    expect(page).to_not have_content(nation2.name)
  end

  it 'displays the nation landlocked boolean' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: true, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"

    expect(page).to have_content(nation.landlocked)
    expect(page).to_not have_content(nation2.landlocked)
  end

  it 'displays the nation population' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"

    expect(page).to have_content(nation.population)
    expect(page).to_not have_content(nation2.population)
  end

  it 'displays the nation national_language' do
    nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    visit "/nations/#{nation.id}"
    save_and_open_page
    expect(page).to have_content(nation.national_language)
    expect(page).to_not have_content(nation2.national_language)
  end
end