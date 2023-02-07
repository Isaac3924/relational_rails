require 'rails_helper'

RSpec.describe Ancestry, type: :model do
  before :each do
		@nation = Nation.create!(name: "Gahlland", landlocked: false, population: 324, national_language: "Gahlish")
    @nation2 = Nation.create!(name: "Bjornsval", landlocked: false, population: 212, national_language: "Bjornish")
    @ancestry = @nation.ancestries.create!(name: "Elves", darkvision: false, population: 1500, patron_deity: "Faesren")
    @ancestry2 = @nation.ancestries.create!(name: "Orcs", darkvision: true, population: 32000, patron_deity: "Orrug")
    @ancestry3 = @nation2.ancestries.create!(name: "Dwarves", darkvision: true, population: 150000, patron_deity: "Dorfgunir")
    @ancestry4 = @nation2.ancestries.create!(name: "Alfs", darkvision: true, population: 1500, patron_deity: "Alfan")
  end

  it 'can filter ancestries by population ammount' do
    expect(Ancestry.filter_ancestries(5000)).to eq([@ancestry2, @ancestry3])
  end
end