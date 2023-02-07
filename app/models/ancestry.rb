class Ancestry < ApplicationRecord
  belongs_to :nation

  scope :sort_alphabetically, -> { order(name: :asc) }
  
  def self.filter_ancestries(int)
    where("population > #{int}")
  end
end
